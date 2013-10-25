class AddQuoteFromDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :quote, :integer
  end
end
