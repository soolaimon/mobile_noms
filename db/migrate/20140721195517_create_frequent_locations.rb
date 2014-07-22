class CreateFrequentLocations < ActiveRecord::Migration
  def change
    create_table :frequent_locations do |t|
      t.string :street_address
      t.string :street_address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude, default: 0.0
      t.float :longitude, default: 0.0
      t.integer :truck_id, null:false
      t.timestamps
    end
  end
end
