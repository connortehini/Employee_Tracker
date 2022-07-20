class ProjectsController < ApplicationController
  
  def index 
    @projects = Project.all
    authorize @projects
  end 

  def show 
    @project = Project.find(params[:id])
    @users = @project.users
    authorize @project
  end 

  def new 
    @project = Project.new 
    authorize @project
  end 

  def create 
    @project = Project.new(project_params)
    authorize @project

    if @project.save 
      redirect_to projects_path
    else 
      render :new
    end 
  end 

  def edit 
    @project = Project.find(params[:id])
    authorize @project
  end 

  def update 
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(project_params)
      redirect_to @project
    else 
      render :edit
    end 
  end 

  def destroy
    @project = Project.find(params[:id])
    authorize @project
    @project.destroy
    redirect_to root_path
  end 

  private
  def project_params
    params.require(:project).permit(:job)
  end 
end
