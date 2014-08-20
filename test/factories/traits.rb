FactoryGirl.define do
  sequence :name do |n|
    "Named thing #{n}"
  end

  sequence :description do |n|
    "This is a test description. #{n}"
  end

  sequence :email do |n|
    "testemail#{n}@test.com"
  end

  sequence :password do |n|
    "plzuseme#{n}"
  end
end
