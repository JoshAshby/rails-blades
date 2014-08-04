require 'test_helper'

class ShavingControllerTest < ActionController::TestCase
  test "should get index with jumbotron for no brands" do
    get :index
    assert_response :success

    assert_template :index
    assert_template layout: "layouts/application"

    assert_select 'div.jumbotron' do
      assert_select 'a.btn'
    end
  end

  test "should get index with the ul list with one li" do
    assert create :shaving_brand

    get :index
    assert_response :success

    assert_template :index
    assert_template layout: "layouts/application"

    assert_select 'ul#shaving-supplies' do
      assert_select 'li#brands'
    end
  end

  test "should get index with the ul list and two li" do
    assert create :shaving_product, :with_brand, :with_type

    get :index
    assert_response :success

    assert_template :index
    assert_template layout: "layouts/application"

    assert_select 'ul#shaving-supplies' do
      assert_select 'li#brands'
      assert_select 'li#products'
    end
  end

  test "should get index with the ul list and all li" do
    assert create :shaving_product, :with_brand, :with_type, :with_reviews

    get :index
    assert_response :success

    assert_template :index
    assert_template layout: "layouts/application"

    assert_select 'ul#shaving-supplies' do
      assert_select 'li#brands'
      assert_select 'li#products'
      assert_select 'li#reviews'
    end
  end
end
