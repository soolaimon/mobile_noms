class AddDefaultValuesToLongAndLat < ActiveRecord::Migration
  def change
    change_column :locations, :latitude, :float, default: 0.0
    change_column :locations, :longitude, :float, default: 0.0
  end
end
