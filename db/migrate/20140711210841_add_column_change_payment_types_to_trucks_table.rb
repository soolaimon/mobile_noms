class AddColumnChangePaymentTypesToTrucksTable < ActiveRecord::Migration
  def change
    add_column :trucks, :cash, :boolean
  end
end
