class ProvincesController < ApplicationController
  def index
    @provinces = Province.all
  end
  
  def new
    @province = Province.new
    @mode = params[:mode]
  end
  def show
    
  end
  def create
    if params[:btnDelete]
      respond_to do |format|
        format.js { render :action => "delete" }
      end
    else
      @province = Province.new(province_params)
      @mode= params[:mode]
      @province.save
      respond_to do |f|
        #f.html { redirect_to action: 'new' }
        f.js 
      end
     end
  end
  def edit
    @provinces = Province.all
    @province = Province.find(params[:id])
    @mode = params[:mode]
    render "new"
  end
  def update
    @province = Province.find(params[:id])
    @mode= params[:mode]
    @province.update(province_params)
    respond_to do |f|
      f.js {render "create"}
    end
  end
  def delete
    @ids = ""
    @provinceselection= params[:province] 
    @provinceselection.each { |f| 
      # @ids += f.to_s() + ","
      @province = Province.find(f)
      if (@province)
      @province.destroy
      end
      }
   
  end
  private
  def province_params
    params.require(:province).permit(:name,:mode)
  end
end
