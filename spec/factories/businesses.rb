# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :business do
    name { Faker::Company.name }
    description { Faker::Lorem.paragraph }
  end
end
