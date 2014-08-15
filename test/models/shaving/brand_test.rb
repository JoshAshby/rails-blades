require 'test_helper'

module Shaving
  class BrandTest < ActiveSupport::TestCase
    test "can we not save a nil-named brand?" do
      assert_raises ActiveRecord::RecordInvalid do
        create :shaving_brand, :name => nil
      end
    end

    test "can we save a brand?" do
      assert create :shaving_brand
    end

    test "do we fail when creating multiple brands with the same name?" do
      brand = build :shaving_brand
      brand.save

      assert_raises ActiveRecord::RecordInvalid do
        create :shaving_brand, :name => brand.name
      end
    end

    test "is a brand a brand?" do
      brand = build_stubbed :shaving_brand

      assert_instance_of Brand, brand, "Brand isn't an instance of Shaving::Brand"
    end
  end
end
