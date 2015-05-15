class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    session[:session_token] != nil
  end

  def sign_in(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def redirect_to_sign_in_page
    unless logged_in?
      flash[:notice] = ['You must be logged in to do that']
      redirect_to new_session_url
    end
  end

end
