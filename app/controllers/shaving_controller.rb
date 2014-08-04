class ShavingController < ApplicationController
  def index
    @brands = Shaving::Brand.all.count
    @products = Shaving::Product.all.count
    @reviews = Shaving::Review.all.count
  end
end
