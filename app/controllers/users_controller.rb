class UsersController < ApplicationController

  #layout 'layout', :only => [:first_action, :second_action]
  #layout 'second_layout', :only => [:third_action, :fourth_action]

  # before_action :require_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_editor, only: [:show, :edit]
  # before_action :require_admin, only: [:destroy]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      if @user.save
        session[:first_name]   = nil
        session[:last_name] = nil
        session[:email] = nil
        cookies.permanent[:auth_token] = @user.auth_token
        session[:user_id] = @user.id
        redirect_to root_url
      else
        session[:errors] = @user.errors.full_messages
     # flash[:error] = "validation problem"
      redirect_to signup_url
      end

  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
