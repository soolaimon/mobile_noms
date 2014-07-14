class AddColumnTwitterHandleToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :twitter_handle, :string
  end
end
