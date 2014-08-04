# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :shaving_review, :class => 'Shaving::Review' do
    comments { generate(:description) }

    overall_rating 5
    face_feel 5
    shaving_feel 5
  end

  trait :with_product do
    association :product, :with_brand, :with_type, factory: :shaving_product
  end

  trait :with_too_high_overall_rating do
    overall_rating 11
  end

  trait :with_too_low_overall_rating do
    overall_rating -1
  end
end
