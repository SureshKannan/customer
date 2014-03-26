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
  def searchOrdelete
    if params[:btnDelete]
      delete
      render "delete"
    end
  end
  
  def create
      @province = Province.new(province_params)
      @mode= params[:mode]
      @province.save
      respond_to do |f|
        f.js 
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
    @provinceselection= params[:ps] 
    @provinceselection.each { |f| 
      # @ids += f.to_s() + ","
      @province = Province.find(f)
      if (@province)
      @province.destroy
      end
      }
      # @provinces = Province.all
      # respond_to do |f|
        # f.js { render "alert('i am ok);"} 
      # end
  end
  private
  def province_params
    if :province.nil?
      params.permit(:name,:mode,:ps)
    else
      params.require(:province).permit(:name,:mode,:ps)
    end
  end
end
