class AddObIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :obfuscated_id, :string
  end
end
