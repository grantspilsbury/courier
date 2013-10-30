class RemoveSavedAddresses < ActiveRecord::Migration
  def up
    remove_column :users, :saved_addresses
  end

  def down
    add_column :users, :saved_addresses, :text
  end
end
