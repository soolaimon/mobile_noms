class ChangePaymentTypesToDefaultFalse < ActiveRecord::Migration
  def change
    change_column :trucks, :visa, :boolean, default: false
    change_column :trucks, :mastercard, :boolean, default: false
    change_column :trucks, :discover, :boolean, default: false
    change_column :trucks, :american_express, :boolean, default: false
    change_column :trucks, :cash, :boolean, default: false
  end
end
