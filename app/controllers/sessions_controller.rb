class SessionsController < ApplicationController
  def new
    flash.now[:errors] = nil
    @user = User.new
  end

  def create
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_credentials(email, password)
    if @user.nil?
      @user = User.new
      flash.now[:errors] = ["Incorrect email and password combination"]
      render :new
      return
    else
      session[:session_token] = @user.reset_session_token!
      flash.now[:notice] = 'Successfully signed in!'
      redirect_to user_url(@user)
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to users_url
  end
end
