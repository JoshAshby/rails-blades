# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_product, :class => 'Shaving::Product' do
    name
  end

  trait :with_reviews do
    after :create do |product, evaluator|
      FactoryGirl.create_list :shaving_review, 5, :product => product
    end
  end

  trait :with_brand do
    association :brand, factory: :shaving_brand
  end

  trait :with_type do
    association :type, factory: :shaving_type
  end
end
