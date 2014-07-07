class MakeBussinessIdForTrucksNullFalse < ActiveRecord::Migration
  def change
    change_column :trucks, :business_id, :integer, null:false
  end
end
