class WelcomeController < ApplicationController
  def index
    @brands = Brand.all
    @blades = Blade.all
    @soaps = Soap.all
  end
end
