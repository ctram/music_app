class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        sign_in(@user)
        redirect_to users_url
      else
        flash[:errors] = @user.errors.full_messages
        render :new
      end
    end

    def show
      @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
