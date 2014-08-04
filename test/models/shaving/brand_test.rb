require 'test_helper'

class Shaving::BrandTest < ActiveSupport::TestCase
  test "can we not save a nil-named brand?" do
    assert_raises ActiveRecord::RecordInvalid do
      create :shaving_brand, :nilname
    end
  end

  test "can we save a brand?" do
    assert create :shaving_brand
  end

  test "is a brand a brand?" do
    brand = build_stubbed :shaving_brand

    assert_instance_of Shaving::Brand, brand, "Brand isn't an instance of Shaving::Brand"
  end
end
