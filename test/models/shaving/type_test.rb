require 'test_helper'

class Shaving::TypeTest < ActiveSupport::TestCase
  test "can we make a new type?" do
    assert create :shaving_type
  end

  test "do we fail when making a nilnamed type?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_type, :name => nil
    end
  end

  test "can we get a list of products from a type?" do
    type = create :shaving_type, :with_products

    assert type.products, "Couldn't get a list of products"

    assert_equal 5, type.products.length

    assert_instance_of Shaving::Product, type.products.first, "Product isn't an instance of Shaving::Product"
  end
end
