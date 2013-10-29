class RenameRecentAddressesToSavedAddresses < ActiveRecord::Migration
  def up
    rename_column :users, :recent_addresses, :saved_addresses
  end

  def down
    rename_column :users, :saved_addresses, :recent_addresses
  end
end
