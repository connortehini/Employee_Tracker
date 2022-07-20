class ProjectsUsersController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @project_user = ProjectsUser.new(projects_users_params)
    authorize @project_user
    @project_user.save
    redirect_to user_path(user)

  end 

  def destroy
    @project_user = ProjectsUser.find_by( params[:project_id].present? ? {project_id: params[:project_id]} : {user_id: params[:user_id]})
    authorize @project_user
    @project_user.destroy
    redirect_to project_path
  end 

  private
    def projects_users_params
      params.permit(:user_id, :project_id)
    end
end
  