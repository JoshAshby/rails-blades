require 'test_helper'

class Shaving::ReviewTest < ActiveSupport::TestCase
  test "Can we make a new review?" do
    assert create :shaving_review, :with_product
  end

  test "do we fail on a review with no product?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review
    end
  end

  test "do we fail on a review with a too high overall rating?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :overall_rating => 11
    end
  end

  test "do we fail on a review with a too low overall rating?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :overall_rating => -1
    end
  end

  test "do we fail on a review with a too high face feel?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :face_feel => 11
    end
  end

  test "do we fail on a review with a too low face feel?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :face_feel => -1
    end
  end

  test "do we fail on a review with a too high shaving feel?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :shaving_feel => 11
    end
  end

  test "do we fail on a review with a too low shaving feel?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :shaving_feel => -1
    end
  end
end
