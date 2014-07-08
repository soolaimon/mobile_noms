# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :truck do
    name { Faker::Company.name }
    food_type { Faker::Lorem.word}
    description { Faker::Lorem.paragraph }
  end
end

    # t.string   "name",        null: false
    # t.string   "food_type"
    # t.text     "description"
    # t.integer  "business_id"
    # t.datetime "starts_at"
    # t.datetime "ends_at"
