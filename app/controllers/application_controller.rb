class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user



  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #normal user
  def require_user
    redirect_to '/login' unless current_user
  end

  #editor
  def require_editor
    redirect_to '/' unless current_user.editor?
  end

  #admin
  def require_admin
    redirect_to '/' unless current_user.admin?
  end

  #logged user can't access signin/signup
  def logged_user
    redirect_to '/' if current_user
  end
end
