require 'test_helper'

module Shaving
  class ProductsControllerTest < ActionController::TestCase
    def create_type_and_brand
      @brand = create :shaving_brand
      @type = create :shaving_type
    end

    test "does index return correctly?" do
      create_type_and_brand

      get :index
      assert_response :success

      assert_not_nil assigns :products
      assert_not_nil assigns :brands
    end

    test "Having no brands redirects the index correctly?" do
      get :index

      assert_redirected_to new_brand_path
    end

    test "does new return correctly?" do
      create_type_and_brand

      get :new
      assert_response :success

      assert_template partial: '_form'
      assert_not_nil assigns :product
      assert_not_nil assigns :brands
      assert_not_nil assigns :types
    end

    test "can we post an empty product and have it render the new form?" do
      create_type_and_brand

      post :create, product: {name: nil}

      assert_template :new
      assert_template partial: '_form'
      assert_not_nil assigns :product
      assert_not_nil assigns :brands
      assert_not_nil assigns :types
    end

    test "can we post a new product and have it redirect corrrectly?" do
      create_type_and_brand

      assert_difference 'Shaving::Product.all.count', 1 do
        post :create, product: {name: 'Test', brand_id: @brand, type_id: @type}
      end

      assert_redirected_to product_path(assigns(:product))
    end

    test "can we view the show page for a product?" do
      product = create :shaving_product, :with_brand, :with_type

      get :show, {:id => product.id}
      assert_response :success

      assert_template :show
      assert_not_nil assigns :product
    end

    test "can we view the edit page for a product?" do
      product = create :shaving_product, :with_brand, :with_type

      get :edit, {:id => product.id}
      assert_response :success

      assert_template :edit
      assert_template partial: '_form'
      assert_not_nil assigns :product
      assert_not_nil assigns :brands
      assert_not_nil assigns :types
    end

    test "can we update a product?" do
      product = build :shaving_product, :with_brand, :with_type
      product.save

      product.name = "TestTestTest"

      put :update, id: product.id, product: {name: product.name}

      assert_redirected_to product_path(assigns(:product))
    end

    test "can we delete a product?" do
      product = build :shaving_product, :with_brand, :with_type
      assert product.save

      assert_difference 'Shaving::Product.all.count', -1 do
        delete :destroy, id: product.id
      end

      assert_redirected_to products_path
    end
  end
end
