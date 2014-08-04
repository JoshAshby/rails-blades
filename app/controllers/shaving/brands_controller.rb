class Shaving::BrandsController < ApplicationController
  before_action :find_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Shaving::Brand.all
  end

  def new
    @brand = Shaving::Brand.new
  end

  def create
    @brand = Shaving::Brand.new brand_params

    if @brand.save
      redirect_to @brand
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @brand.update shaving_brand_params

    if @brand.save
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    if @brand.destroy
      redirect_to shaving_brands_path
    else
      redirect_to edit_shaving_brand_path(@brand)
    end
  end

  private
    def brand_params
      params.require(:shaving_brand).permit(:name)
    end

    def find_brand
      @brand = Shaving::Brand.find params[:id]
    end
end
