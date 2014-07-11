class AddColumnCreditCardsToTrucksTable < ActiveRecord::Migration
  def change
    add_column :trucks, :visa, :boolean
    add_column :trucks, :mastercard, :boolean
    add_column :trucks, :discover, :boolean
    add_column :trucks, :american_express, :boolean
  end
end
