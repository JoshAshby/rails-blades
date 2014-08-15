require 'test_helper'

module Shaving
  class TypeTest < ActiveSupport::TestCase
    test "can we make a new type?" do
      assert create :shaving_type
    end

    test "do we fail when making a nilnamed type?" do
      assert_raises ActiveRecord::RecordInvalid do
        create :shaving_type, :name => nil
      end
    end

    test "do we fail when creating multiple types with the same name?" do
      type = build :shaving_type
      type.save

      assert_raises ActiveRecord::RecordInvalid do
        create :shaving_type, :name => type.name
      end
    end

    test "can we get a list of products from a type?" do
      type = create :shaving_type, :with_products

      assert type.products, "Couldn't get a list of products"

      assert_equal 5, type.products.length

      assert_instance_of Product, type.products.first, "Product isn't an instance of Shaving::Product"
    end
  end
end
