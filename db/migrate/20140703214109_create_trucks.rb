class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :name, null: false
      t.string :food_type
      t.text :description
      t.integer :business_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
  end
end
