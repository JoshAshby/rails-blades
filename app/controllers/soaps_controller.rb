class SoapsController < ApplicationController
  def index
    @soaps = Soap.all
    @brands = Brand.all
  end

  def new
    @soap = Soap.new :brand_id => params[:brand_id]
    @brands = Brand.all
  end

  def create
    @soap = Soap.new soap_params

    if @soap.save
      redirect_to @soap
    else
      @brands = Brand.all
      render 'new'
    end
  end

  def show
    @soap = Soap.find params[:id]
  end

  def edit
    @soap = Soap.find params[:id]
    @brands = Brand.all
  end

  def update
    @soap = Soap.find params[:id]
    @soap.update soap_params

    if @soap.save
      redirect_to @soap
    else
      @brands = Brand.all
      render 'edit'
    end
  end

  def destroy
    @soap = Soap.find params[:id]

    if @soap.destroy
      redirect_to soaps_path
    else
      @brands = Brand.all
      render 'edit'
    end
  end

  private
    def soap_params
      params.require(:soap).permit :name, :description, :brand_id
    end
end
