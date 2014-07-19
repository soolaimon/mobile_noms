user = User.first

t1 = Truck.new(
  name:            'Super Taco',
  food_type:       'Happy Mexican Food',
  description:     'Best Mexican food to make people high',
  user_id:         user.id,
  image:           nil,
  monday_open:     "7:00 am",
  monday_close:    "7:00 pm",
  tuesday_open:    "7:00 am",
  tuesday_close:   "7:00 pm",
  wednesday_open:  "7:00 am",
  wednesday_close: "7:00 pm",
  thursday_open:   "7:00 am",
  thursday_close:  "7:00 pm",
  friday_open:     "7:00 am",
  friday_close:    "7:00 pm",
  saturday_open:   "7:00 am",
  saturday_close:  "7:00 pm",
  sunday_open:     "7:00 am",
  sunday_close:    "7:00 pm",
  twitter_handle:  'soolaimon'
  )

t1.save

t2 = Truck.new(
  name:            'Space Sushi',
  food_type:       'Tokyo style new generation sushi',
  description:     'We only have sushi. No other Japanese foods.',
  user_id:         user.id,
  image:           nil,
  monday_open:     "7:00 am",
  monday_close:    "7:00 pm",
  tuesday_open:    "7:00 am",
  tuesday_close:   "7:00 pm",
  wednesday_open:  "7:00 am",
  wednesday_close: "7:00 pm",
  thursday_open:   "7:00 am",
  thursday_close:  "7:00 pm",
  friday_open:     "7:00 am",
  friday_close:    "7:00 pm",
  saturday_open:   "7:00 am",
  saturday_close:  "7:00 pm",
  sunday_open:     "7:00 am",
  sunday_close:    "7:00 pm",
  twitter_handle:  'blank'
  )

t2.save

