class AddSiteUrlToTruck < ActiveRecord::Migration
  def change
    add_column :trucks, :website, :string
  end
end
