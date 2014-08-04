# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_brand, :class => 'Shaving::Brand' do
    name
  end
end
