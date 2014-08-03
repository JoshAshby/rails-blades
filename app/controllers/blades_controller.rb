class BladesController < ApplicationController
  def index
    @blades = Blade.all
  end

  def new
    @blade = Blade.new
    @brands = Brand.all
  end

  def create
    @blade = Blade.new blade_params

    if @blade.save
      redirect_to @blade
    else
      render 'new'
    end
  end

  def show
    @blade = Blade.find params[:id]
  end

  def edit
    @blade = Blade.find params[:id]
    @brands = Brand.all
  end

  def update
    @blade = Blade.find params[:id]
    @blade.update blade_params

    if @blade.save
      redirect_to @blade
    else
      render 'edit'
    end
  end

  def destroy
    @blade = Blade.find params[:id]

    if @blade.destroy
      redirect_to blades_path
    else
      render 'edit'
    end
  end

  private
    def blade_params
      params.require(:blade).permit :name, :description
    end
end
