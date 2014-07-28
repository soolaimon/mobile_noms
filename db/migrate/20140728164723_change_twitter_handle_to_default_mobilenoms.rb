class ChangeTwitterHandleToDefaultMobilenoms < ActiveRecord::Migration
  def change
    change_column :trucks, :twitter_handle, :string, null: false, default: "mobilenoms"
  end
end
