class RemoveFromAreaDeliveries < ActiveRecord::Migration
  def up
    remove_column :deliveries, :from_area
    remove_column :deliveries, :to_area
    remove_column :deliveries, :quote
  end

  def down
    add_column :deliveries, :from_area, :string
    add_column :deliveries, :to_area, :string
    add_column :deliveries, :quote, :string
  end
end
