require 'test_helper'

class Shaving::ReviewsControllerTest < ActionController::TestCase
  test "does index return correctly?" do
    create :shaving_product, :with_type, :with_brand

    get :index
    assert_response :success

    assert_not_nil assigns :reviews
    assert_not_nil assigns :products
  end

  test "does new return correctly?" do
    create :shaving_product, :with_type, :with_brand

    get :new
    assert_response :success

    assert_template partial: '_form'
    assert_not_nil assigns :review
    assert_not_nil assigns :products
  end

  test "can we post an empty review and have it render the new form?" do
    create :shaving_product, :with_type, :with_brand

    post :create, shaving_review: {comments: ''}

    assert_response :success

    assert_template :new
    assert_template partial: '_form'
    assert_not_nil assigns :review
    assert_not_nil assigns :products
  end

  test "can we post a new review and have it redirect corrrectly?" do
    product = build :shaving_product, :with_type, :with_brand
    product.save

    assert_difference 'Shaving::Review.all.count', 1 do
      post :create, shaving_review: {comments: 'Test', overall_rating: 1, face_feel: 2, shaving_feel: 3, product_id: product}
    end

    assert_redirected_to shaving_review_path(assigns(:review))
  end

  test "can we view the show page for a review?" do
    review = create :shaving_review, :with_product

    get :show, {:id => review.id}
    assert_response :success

    assert_template :show
    assert_not_nil assigns :review
  end

  test "can we view the edit page for a review?" do
    review = create :shaving_review, :with_product

    get :edit, {:id => review.id}
    assert_response :success

    assert_template :edit
    assert_template partial: '_form'
    assert_not_nil assigns :review
    assert_not_nil assigns :products
  end

  test "can we update a review?" do
    review = build :shaving_review, :with_product
    review.save

    put :update, id: review.id, shaving_review: {comment: 'WATWATWAT'}

    assert_redirected_to shaving_review_path(assigns(:review))
  end

  test "can we delete a review?" do
    review = build :shaving_review, :with_product
    assert review.save

    assert_difference 'Shaving::Review.all.count', -1 do
      delete :destroy, id: review.id
    end

    assert_redirected_to shaving_reviews_path
  end

end
