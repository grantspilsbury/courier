class AddFeeToDeliveries < ActiveRecord::Migration
  def change
    add_column :deliveries, :fee, :integer
  end
end
