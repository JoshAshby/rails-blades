class Shaving::BrandsController < ApplicationController
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
    @brand = Shaving::Brand.find params[:id]
  end

  def edit
    @brand = Shaving::Brand.find params[:id]
  end

  def update
    @brand = Shaving::Brand.find params[:id]
    @brand.update brand_params

    if @brand.save
      redirect_to @brand
    else
      render 'edit'
    end
  end

  def destroy
    @brand = Shaving::Brand.find params[:id]

    if @brand.destroy
      redirect_to brands_path
    else
      render 'edit'
    end
  end

  private
    def brand_params
      params.require(:shaving_brand).permit(:name)
    end
end
