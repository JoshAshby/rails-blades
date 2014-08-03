class Shaving::ReviewsController < ApplicationController
  def index
    @reviews = Shaving::Review.all
    @products = Shaving::Product.all
  end

  def new
    @review = Shaving::Review.new :product_id => params[:product_id]
    @products = check_products
  end

  def create
    @review = Shaving::Review.new review_params

    if @review.save
      redirect_to @review
    else
      @products = check_products
      render 'new'
    end
  end

  def show
    @review = Shaving::Review.find params[:id]
  end

  def edit
    @review = Shaving::Review.find params[:id]
    @products = check_products
  end

  def update
    @review = Shaving::Review.find params[:id]
    @review.update review_params

    if @review.save
      redirect_to @review
    else
      @products = check_products
      render 'edit'
    end
  end

  def destroy
    @review = Shaving::Review.find params[:id]

    if @review.destroy
      redirect_to shaving_reviews_path
    else
      @products = check_products
      render 'edit'
    end
  end

  private
    def review_params
      params.require(:shaving_review).permit :comments, :overall_rating, :face_feel, :shave_feel, :product_id
    end

    def check_products
      @products = Shaving::Product.all

      if not @products.any?
        redirect_to new_shaving_product_path
      end

      @products
    end
end
