class DivisionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index 
    @divisions = Division.all
  end 

  def show 
    @division = Division.find(params[:id])
    @employees = @division.employees
    authorize @division
  end 

  def new 
    @division = Division.new
    authorize @division
  end 

  def create 
    @division =  Division.new(div_params)

    if @division.save 
      redirect_to @division
    else 
      render :new
    end 
    authorize @division
  end 

  def edit 
    @division = Division.find(params[:id])
    authorize @division
  end 

  def update 
    @division = Division.find(params[:id])
    authorize @division 
    if @division.update(div_params)
      redirect_to @division
    else 
      render :edit 
    end
  end 

  def destroy 
    @division = Division.find(params[:id])
    @division.destroy
    redirect_to root_path
    authorize @division
  end 

  private 
    def div_params
      params.require(:division).permit(:title, :division_id)
    end 
end
