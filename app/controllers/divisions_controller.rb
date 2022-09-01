class DivisionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index


  #GET /divisions
  def index 
    @divisions = Division.all
    json_response(@divisions)
  end 

  #GET /divisions/:id
  def show 
    @division = Division.find(params[:id])
    @users = @division.users
    authorize @division
  end 

  #GET /divisions/new
  def new 
    @division = Division.new
    authorize @division
  end 

  # POST /divisions
  def create 
    @division =  Division.new(div_params)

    if @division.save 
      redirect_to @division
    else 
      render :new
    end 
    authorize @division
  end 

  # GET /divisions/:id/edit
  def edit 
    @division = Division.find(params[:id])
    authorize @division
  end 

  #PUT /:division/:id
  def update 
    @division = Division.find(params[:id])
    authorize @division 
    if @division.update(div_params)
      redirect_to @division
    else 
      render :edit 
    end
  end 

  #DELETE /divisions/:id
  def destroy 
    @division = Division.find(params[:id])
    authorize @division
    @division.destroy
    redirect_to root_path
  end 

  private 
    def div_params
      params.require(:division).permit(:title, :division_id)
    end 
end
