class AddNullFalseToUserIdOnTruck < ActiveRecord::Migration
  def change
    change_column :trucks, :user_id, :integer, null: false
  end
end
