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
      create :shaving_review, :with_product, :with_too_high_overall_rating
    end
  end

  test "do we fail on a review with a too low overall rating?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_review, :with_product, :with_too_low_overall_rating
    end
  end
end
