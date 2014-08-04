# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_type, :class => 'Shaving::Type' do
    name
  end
end
