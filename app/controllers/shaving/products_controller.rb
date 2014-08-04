class Shaving::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  before_action :find_all_brands_and_types, only: [:new, :create, :edit, :update]

  def index
    @products = Shaving::Product.all
  end

  def new
    @product = Shaving::Product.new :brand_id => params[:brand]

    if not @brands.any?
      redirect_to new_shaving_brand_path
    end
  end

  def create
    @product = Shaving::Product.new product_params

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update product_params

    if @product.save
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to shaving_products_path
    else
      redirect_to edit_shaving_product_path @product
    end
  end

  private
    def product_params
      params.require(:shaving_product).permit :name, :description, :brand_id, :type_id
    end

    def find_all_brands_and_types
      @brands = Shaving::Brand.all
      @types = Shaving::Type.all
    end

    def find_product
      @product = Shaving::Product.find params[:id]
    end
end
