# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.first

t1 = Truck.new(
  name:            'Super Taco',
  food_type:       'Happy Mexican Food',
  description:     'Best Mexican food to make people high',
  user_id:         user.id,
  image:           nil,
  monday_open: "7:00 am",
  monday_close: "7:00 pm",
  tuesday_open: "7:00 am",
  tuesday_close: "7:00 pm",
  wednesday_open: "7:00 am",
  wednesday_close: "7:00 pm",
  thursday_open: "7:00 am",
  thursday_close: "7:00 pm",
  friday_open: "7:00 am",
  friday_close: "7:00 pm",
  saturday_open: "7:00 am",
  saturday_close: "7:00 pm",
  sunday_open: "7:00 am",
  sunday_close: "7:00 pm"

  )
t1.save

t2 = Truck.new(
  name:            'Space Sushi',
  food_type:       'Tokyo style new generation sushi',
  description:     'We only have sushi. No other Japanese foods.',
  user_id:         user.id,
  image:           nil,
  monday_open: "7:00 am",
  monday_close: "7:00 pm",
  tuesday_open: "7:00 am",
  tuesday_close: "7:00 pm",
  wednesday_open: "7:00 am",
  wednesday_close: "7:00 pm",
  thursday_open: "7:00 am",
  thursday_close: "7:00 pm",
  friday_open: "7:00 am",
  friday_close: "7:00 pm",
  saturday_open: "7:00 am",
  saturday_close: "7:00 pm",
  sunday_open: "7:00 am",
  sunday_close: "7:00 pm"
  )

t2.save

loc1 = Location.new({
  street_address: "813 Melrose Terrace", city: "Newport News", state: "VA", zip: "23608", truck_id: t1.id
  })

loc1.save

loc2 = Location.new({
  street_address: "184 N 50 E", city: "Orem", state: "UT", zip: "84057", truck_id: t2.id
  })

loc2.save



