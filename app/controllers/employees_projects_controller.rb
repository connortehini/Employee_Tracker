class EmployeesProjectsController < ApplicationController
  
  def create
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:project_id])
    # authorize @employee
    authorize @project
    @project.employees_projects.create(employee_id: params[:employee_id])
    redirect_to employee_path(@employee)
  end 

  def destroy
    @employee = Employee.find(params[:employee_id]) 
    if params[:project_id].present?
      @project = Project.find(params[:project_id])
      authorize @project
      @project.employees_projects.first.destroy
      redirect_to employee_path(@employee)
    else
     @employee.employees_projects.first.destroy
     redirect_to project_path
    end
  end 

  private
    def employee_project_params
      params.permit(:job)
    end
end
