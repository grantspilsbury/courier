class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.string :from_address
      t.string :from_area
      t.string :to_address
      t.string :to_area
      t.string :special_instructions
      t.string :quote
      t.references :user

      t.timestamps
    end
    add_index :deliveries, :user_id
  end
end
