class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.string :chargify_subscription_id
      t.references :user

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :chargify_subscription_id, unique: true
  end
end
