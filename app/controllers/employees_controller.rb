class EmployeesController < ApplicationController
  
  def index 
    @employees = Employee.all
    authorize @employees
  end 

  def show 
    @employee = Employee.find(params[:id])
    authorize @employee
  end 

  def new 
    @employee = Employee.new
    authorize @employee
  end 

  def create 
    @employee = Employee.new(employee_params)
    authorize @employee

    if @employee.save 
      redirect_to @employee
    else 
      render :new 
    end 
  end 

  def edit 
    @employee = Employee.find(params[:id])
    authorize @employee
  end 

  def update 
    @employee =Employee.find(params[:id])
    authorize @employee

    if @employee.update(employee_params)
      redirect_to @employee
    else 
      render :edit 
    end 
  end 

    def destroy 
      @employee = Employee.find(params[:id])
      authorize @employee
      @employee.destroy 
      redirect_to root_path 
    end 

    private 
    def employee_params
      params.require(:employee).permit(:name, :division_id)
    end
end
