class AddSizeToDelivery < ActiveRecord::Migration
  def change
    add_column :deliveries, :size, :string
  end
end
