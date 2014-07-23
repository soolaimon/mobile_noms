class AddPlainAddressToFrequentLocation < ActiveRecord::Migration
  def change
    add_column :frequent_locations, :address, :string
  end
end
