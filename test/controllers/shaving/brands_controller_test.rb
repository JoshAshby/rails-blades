require 'test_helper'

class Shaving::BrandsControllerTest < ActionController::TestCase
  test "does index return correctly?" do
    get :index
    assert_response :success

    assert_not_nil assigns :brands
  end

  test "does new return correctly?" do
    get :new
    assert_response :success

    assert_template partial: '_form'
    assert_not_nil assigns :brand
  end

  test "can we post an empty brand and have it render the new form?" do
    post :create, shaving_brand: {name: ''}

    assert_template :new
    assert_template partial: '_form'
    assert_not_nil assigns :brand
  end

  test "can we post a new brand and have it redirect corrrectly?" do
    assert_difference 'Shaving::Brand.all.count', 1 do
      post :create, shaving_brand: {name: 'Test'}
    end

    assert_redirected_to shaving_brand_path(assigns(:brand))
  end

  test "can we view the show page for a brand?" do
    brand = create :shaving_brand

    get :show, {:id => brand.id}
    assert_response :success

    assert_template :show
    assert_not_nil assigns :brand
  end

  test "can we view the edit page for a brand?" do
    brand = create :shaving_brand

    get :edit, {:id => brand.id}
    assert_response :success

    assert_template :edit
    assert_template partial: '_form'
    assert_not_nil assigns :brand
  end

  test "can we update a brand?" do
    brand = build :shaving_brand
    brand.save

    brand.name = "TestTestTest"

    put :update, id: brand.id, shaving_brand: {name: brand.name}

    assert_redirected_to shaving_brand_path(assigns(:brand))
  end

  test "can we delete a brand?" do
    brand = build :shaving_brand
    assert brand.save

    assert_difference 'Shaving::Brand.all.count', -1 do
      delete :destroy, id: brand.id
    end

    assert_redirected_to shaving_brands_path
  end
end
