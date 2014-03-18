class CitiesController < ApplicationController
  def index
    @cities = City.all
  end
   def new
    @city = City.new
    @mode = params[:mode]
  end
  def create
    @city = City.new(city_params)
    # @city.province = Province.find(params["province_id"])
    @mode= params[:mode]
    @city.save
    respond_to do |f|
      #f.html { redirect_to action: 'new' }
      f.js 
    end
  end
   def edit
    @cities = City.all
    @city = City.find(params[:id])
    @mode = params[:mode]
    render "new"
  end
  def update
    @city = City.find(params[:id])
    @mode= params[:mode]
    @city.update(city_params)
    respond_to do |f|
      f.js {render "create"}
    end
  end
  private
  def city_params
    params.require(:city).permit(:name,:province_id,:mode)
  end
end
