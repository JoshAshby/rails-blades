module Shaving
  class BrandsController < ApplicationController
    before_action :find_brand, only: [:show, :edit, :update, :destroy]

    def index
      @brands = Shaving::Brand.all.order :name
    end

    def new
      @brand = Shaving::Brand.new
    end

    def create
      @brand = Shaving::Brand.new brand_params
      @brand.user = current_user

      if @brand.save
        redirect_to @brand
      else
        render 'new'
      end
    end

    def show
    end

    def edit
    end

    def update
      @brand.update brand_params

      if @brand.save
        redirect_to @brand
      else
        render 'edit'
      end
    end

    def destroy
      if @brand.destroy
        redirect_to brands_path
      else
        redirect_to edit_brand_path(@brand)
      end
    end

    private
      def brand_params
        params.require(:brand).permit :name, :user_id
      end

      def find_brand
        @brand = Shaving::Brand.find params[:id]
      end
  end
end
