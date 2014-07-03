class Business < ActiveRecord::Base
  has_many :users
  has_many :trucks
end
