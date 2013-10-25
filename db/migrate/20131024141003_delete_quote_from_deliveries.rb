class DeleteQuoteFromDeliveries < ActiveRecord::Migration
  def up
    remove_column :deliveries, :quote
  end

  def down
    add_column :deliveries, :quote, :string
  end
end
