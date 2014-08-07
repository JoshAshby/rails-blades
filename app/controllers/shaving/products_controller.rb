class Shaving::ProductsController < ApplicationController
  layout 'shaving'

  before_action :find_product, only: [:show, :edit, :update, :destroy]

  before_action :find_all_brands_and_types, only: [:index, :new, :create, :edit, :update]

  def index
    @products = Shaving::Product.all.order :type_id, :name
  end

  def new
    @product = Shaving::Product.new :brand_id => params[:brand]
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
    respond_to :html, :json
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
      @brands = Shaving::Brand.all.order :name
      @types = Shaving::Type.all.order :name

      unless @brands.any?
        flash[:error] = "You need to create a brand before you can create products!"
        redirect_to new_shaving_brand_path
      end
    end

    def find_product
      @product = Shaving::Product.find params[:id]
    end
end
