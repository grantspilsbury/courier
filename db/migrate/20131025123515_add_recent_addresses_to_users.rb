class AddRecentAddressesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recent_addresses, :text
  end
end
