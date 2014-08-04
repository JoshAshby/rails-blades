require 'test_helper'

class Shaving::ProductTest < ActiveSupport::TestCase
  test "can we make a product?" do
    assert create :shaving_product, :with_brand, :with_type, :with_reviews
  end

  test "is a product a product?" do
    product = build_stubbed :shaving_product

    assert_instance_of Shaving::Product, product, "Product isn't an instance of Shaving::Product!"
  end

  test "can we failt trying to save a nil-named product?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_product, :nilname
    end
  end

  test "do we fail with no brand?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_product, :with_type
    end
  end

  test "do we fail with no type?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_product, :with_brand
    end
  end

  test "do we fail with no brand or type?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_product
    end
  end

  test "can we get the brand?" do
    product = build :shaving_product, :with_brand, :with_type

    assert_instance_of Shaving::Brand, product.brand, "Brand isn't a Shaving::Brand!"
  end

  test "can we get the type?" do
    product = build :shaving_product, :with_brand, :with_type

    assert_instance_of Shaving::Type, product.type, "Type isn't a Shaving::Type!"
  end
end
