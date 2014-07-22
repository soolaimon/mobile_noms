class RemoveIntegerFromFrequentLocations < ActiveRecord::Migration
  def change
    remove_column :frequent_locations, :integer
  end
end
