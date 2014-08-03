class ShavingController < ApplicationController
  def index
    @brands = Shaving::Brand.all
    @products = Shaving::Product.all
  end
end
