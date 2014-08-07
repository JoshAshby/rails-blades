# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n|
    "Named thing #{n}"
  end

  sequence :description do |n|
    "This is a test description. #{n}"
  end
end
