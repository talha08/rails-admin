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
      session[:user_id] = @user.id
      redirect_to root_url
    else
      redirect_to signup_url
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
