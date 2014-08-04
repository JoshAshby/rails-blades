# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_review, :class => 'Shaving::Review' do
    comment { generate(:description) }
  end
end
