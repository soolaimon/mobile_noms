class DropBusinessModel < ActiveRecord::Migration
  def change
    drop_table :businesses
  end
end
