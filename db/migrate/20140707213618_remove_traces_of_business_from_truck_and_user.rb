class RemoveTracesOfBusinessFromTruckAndUser < ActiveRecord::Migration
  def change
    remove_column :users, :business_id
    remove_column :trucks, :business_id
  end
end
