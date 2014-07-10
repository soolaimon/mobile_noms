class SplitHoursToOpenClose < ActiveRecord::Migration
  def change
    remove_column :trucks, :monday_hours 
    remove_column :trucks, :tuesday_hours
    remove_column :trucks, :wedesday_hours
    remove_column :trucks, :thursday_hours
    remove_column :trucks, :friday_hours 
    remove_column :trucks, :saturday_hours
    remove_column :trucks, :sunday_hours 

    add_column :trucks, :monday_open   , :string
    add_column :trucks, :tuesday_open  , :string
    add_column :trucks, :wednesday_open, :string
    add_column :trucks, :thursday_open , :string
    add_column :trucks, :friday_open   , :string
    add_column :trucks, :saturday_open , :string
    add_column :trucks, :sunday_open   , :string

    add_column :trucks, :monday_close   , :string
    add_column :trucks, :tuesday_close  , :string
    add_column :trucks, :wednesday_close, :string
    add_column :trucks, :thursday_close , :string
    add_column :trucks, :friday_close   , :string
    add_column :trucks, :saturday_close , :string
    add_column :trucks, :sunday_close   , :string

  end
end
