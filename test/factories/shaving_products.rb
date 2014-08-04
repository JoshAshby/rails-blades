# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_product, :class => 'Shaving::Product' do
    name
    brand
  end
end
