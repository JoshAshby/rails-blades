# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_type, :class => 'Shaving::Type' do
    name
  end

  trait :with_products do
    after :create do |type, evaluator|
      FactoryGirl.create_list :shaving_product, 5, :with_reviews, :with_brand, :with_type, :type => type
    end
  end
end
