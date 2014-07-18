class AddTwitterValidationToUser < ActiveRecord::Migration
  def change
    change_column :trucks, :twitter_handle, :string, null: false
  end
end
