class Shaving::ReviewsController < ApplicationController
  before_action :check_products, only: [:index, :new, :create, :edit, :update]

  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Shaving::Review.all
  end

  def new
    @review = Shaving::Review.new :product_id => params[:product]
  end

  def create
    @review = Shaving::Review.new review_params

    if @review.save
      redirect_to @review
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @review.update review_params

    if @review.save
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    if @review.destroy
      redirect_to shaving_reviews_path
    else
      redirect_to edit_shaving_reviews_path(@review)
    end
  end

  private
    def review_params
      params.require(:shaving_review).permit :comments, :overall_rating, :face_feel, :shaving_feel, :product_id
    end

    def check_products
      @products = Shaving::Product.all

      if not @products.any?
        redirect_to new_shaving_product_path
      end
    end

    def find_review
      @review = Shaving::Review.find params[:id]
    end
end
