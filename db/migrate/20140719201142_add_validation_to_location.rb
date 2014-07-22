class AddValidationToLocation < ActiveRecord::Migration
  def change
    change_column :locations, :street_address, :string, default: "", null: false
  end
end
