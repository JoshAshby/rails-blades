class Shaving::ProductsController < ApplicationController
  def index
    @products = Shaving::Product.all
  end

  def new
    @product = Shaving::Product.new :brand_id => params[:brand_id]
    @brands = Shaving::Brand.all
    @types = Shaving::Type.all

    if not @brands.any?
      redirect_to new_shaving_brand_path
    end
  end

  def create
    @product = Shaving::Product.new product_params

    if @product.save
      redirect_to @product
    else
      @brands = Shaving::Brand.all
      @types = Shaving::Type.all
      render 'new'
    end
  end

  def show
    @product = Shaving::Product.find params[:id]
  end

  def edit
    @product = Shaving::Product.find params[:id]
    @brands = Shaving::Brand.all
    @types = Shaving::Type.all
  end

  def update
    @product = Shaving::Product.find params[:id]
    @product.update product_params

    if @product.save
      redirect_to @product
    else
      @brands = Shaving::Brand.all
      @types = Shaving::Type.all
      render 'edit'
    end
  end

  def destroy
    @product = Shaving::Product.find params[:id]

    if @product.destroy
      redirect_to shaving_products_path
    else
      @brands = Shaving::Brand.all
      @types = Shaving::Type.all
      render 'edit'
    end
  end

  private
    def product_params
      params.require(:shaving_product).permit :name, :description, :brand_id, :type_id
    end
end
