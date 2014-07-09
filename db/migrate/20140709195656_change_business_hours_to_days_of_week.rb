class ChangeBusinessHoursToDaysOfWeek < ActiveRecord::Migration
  def change
    add_column :trucks, :monday_hours,   :string
    add_column :trucks, :tuesday_hours,  :string
    add_column :trucks, :wedesday_hours, :string
    add_column :trucks, :thursday_hours, :string
    add_column :trucks, :friday_hours,   :string
    add_column :trucks, :saturday_hours, :string
    add_column :trucks, :sunday_hours,   :string
  end 
end
