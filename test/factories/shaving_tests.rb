# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "Named thing #{n}"
  end

  sequence :description do |n|
    "This is a test description. #{n}"
  end

  trait :nilname do
    name nil
  end

  trait :with_brand do
    association :brand, factory: :shaving_brand
  end

  trait :with_type do
    association :type, factory: :shaving_type
  end

  trait :with_product do
    association :product, factory: :shaving_product
  end
end
