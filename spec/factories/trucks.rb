# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :truck do
    name { Faker::Company.name }
    food_type { Faker::Lorem.word}
    description { Faker::Lorem.paragraph }
    monday_open { "7:00 am"}
    monday_close { "7:00 pm"}
    tuesday_open { "7:00 am"}
    tuesday_close { "7:00 pm"}
    wednesday_open { "7:00 am"}
    wednesday_close { "7:00 pm"}
    thursday_open { "7:00 am"}
    thursday_close { "7:00 pm"}
    friday_open { "7:00 am"}
    friday_close { "7:00 pm"}
    saturday_open { "7:00 am"}
    saturday_close { "7:00 pm"}
    sunday_open { "7:00 am"}
    sunday_close { "7:00 pm"}
    twitter_handle { "soolaimon" }
    user
  end
end

    # t.string   "name",            null: false
    # t.string   "food_type"
    # t.text     "description"
    # t.datetime "starts_at"
    # t.datetime "ends_at"
    # t.datetime "created_at"
    # t.datetime "updated_at"
    # t.integer  "user_id",         null: false
    # t.string   "image"
    # t.string   "monday_open"
    # t.string   "tuesday_open"
    # t.string   "wednesday_open"
    # t.string   "thursday_open"
    # t.string   "friday_open"
    # t.string   "saturday_open"
    # t.string   "sunday_open"
    # t.string   "monday_close"
    # t.string   "tuesday_close"
    # t.string   "wednesday_close"
    # t.string   "thursday_close"
    # t.string   "friday_close"
    # t.string   "saturday_close"
    # t.string   "sunday_close"
