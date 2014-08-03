class BrandsController < ApplicationController
  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new brand_params

    if @brand.save
      redirect_to @brand
    else
      render 'new'
    end
  end

  def show
    @brand = Brand.find params[:id]
  end

  def edit
    @brand = Brand.find params[:id]
  end

  def update
    @brand = Brand.find params[:id]
    @brand.update brand_params

    if @brand.save
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    @brand = Brand.find params[:id]

    if @brand.destroy
      redirect_to brands_path
    else
      render 'edit'
    end
  end

  private
    def brand_params
      params.require(:brand).permit(:name)
    end
end
