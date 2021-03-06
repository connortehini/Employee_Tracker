class UsersController < ApplicationController
  before_action :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit( :email, :password, :role)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(  :email, :password, :role)}
  end

  def index 
    @users = policy_scope(User).all
    authorize @users
  end 

  def show 
    @user = User.find(params[:id])
    @projects = @user.projects  
    authorize @user
  end 

  def new 
    @user = User.new 
    authorize @user
  end 

  def create
    @user = User.new(role_params)

    if @user.save 
      redirect_to roles_path
    else 
      render :new
    end 
    authorize @user
  end 

  def edit 
    @user = User.find(params[:id])
    authorize @user
  end 

  def update 
    @user = User.find(params[:id])
    authorize @user
    if @user.update(role_params)
      redirect_to roles_path
    else 
      render :edit
    end 
  end 

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to root_path
  end 

  private
  def role_params
    params.require(:user).permit(:name, :email, :password, :role, :division_id, :user_id)
  end 
end
