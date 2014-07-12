class AddTruckIdToLocationDuh < ActiveRecord::Migration
  def change
    add_column :locations, :truck_id, :integer, null:false
  end
end
