class SessionsController < ApplicationController
  before_action :require_user, only: [:index]
  def index
  end


  def new
  end


 def create
    puts params[:email]
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
        if params[:remember_me]
          cookies.permanent[:auth_token] = user.auth_token
        else
          cookies[:auth_token] = user.auth_token
        end
      session[:user_id] = user.id
      redirect_to root_url , :notice => "Logged in!"
    else
      flash[:error] = "Invalid email or password!"
      redirect_to login_url
    end
  end


  def destroy
    session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to root_url , :notice => "Successfully Logged Out!"
  end




end
