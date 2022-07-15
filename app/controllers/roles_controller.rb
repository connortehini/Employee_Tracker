class RolesController < ApplicationController

  def index 
    @users = User.all
    authorize @users
  end 

  def show 
    @user = User.find(params[:id])
    authorize @user  
  end 

  def new 
    @user = User.new
    authorize @user 
  end 

  def create
    @user = User.new(role_params)
    authorize @user

    if @user.save
      redirect_to roles_path
    else 
      render :new
    end 
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
    params.permit(:email, :password, :role)
  end 
end
