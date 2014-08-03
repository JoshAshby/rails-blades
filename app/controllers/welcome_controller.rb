class WelcomeController < ApplicationController
  def index
    @blades = Blade.all
  end
end
