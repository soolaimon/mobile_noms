# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

trucks = Truck.create([{
  name:            'Super Taco',
  food_type:       'Happy Mexican Food',
  description:     'Best Mexican food to make people high',
  starts_at:       '2014-07-09 10:00:00',
  ends_at:         '2014-07-09 2:30:00',
  created_at:      '2014-07-09 03:44:14',
  updated_at:      '2014-07-09 03:44:14',
  user_id:         2,
  image:           nil
  }])

trucks = Truck.create([{
  name:            'Super Taco',
  food_type:       'Happy Mexican Food',
  description:     'Best Mexican food to make people high',
  starts_at:       '2014-07-09 10:00:00',
  ends_at:         '2014-07-09 2:30:00',
  created_at:      '2014-07-09 03:44:14',
  updated_at:      '2014-07-09 03:44:14',
  user_id:         2,
  image:           nil
  }])
