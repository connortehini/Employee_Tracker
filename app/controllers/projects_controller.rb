class ProjectsController < ApplicationController
  
  #GET /projects
  def index 
    @projects = Project.all
    authorize @projects
    json_response(@projects)
  end 

  #GET /projects/:id
  def show 
    @project = Project.find(params[:id])
    @users = @project.users
    authorize @project
  end 
  
  #GET /projects/new
  def new 
    @project = Project.new 
    authorize @project
  end 

  #POST /projects
  def create 
    @project = Project.new(project_params)
    authorize @project

    if @project.save 
      redirect_to projects_path
    else 
      render :new
    end 
  end 

  #GET /projects/:id/edit
  def edit 
    @project = Project.find(params[:id])
    authorize @project
  end 

  #PUT /:projects/:id
  def update 
    @project = Project.find(params[:id])
    authorize @project

    if @project.update(project_params)
      redirect_to @project
    else 
      render :edit
    end 
  end 

  #DELETE /projects/:id
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
