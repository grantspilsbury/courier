# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131030103250) do

  create_table "deliveries", :force => true do |t|
    t.string   "from_address"
    t.string   "to_address"
    t.string   "special_instructions"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "size"
  end

  add_index "deliveries", ["user_id"], :name => "index_deliveries_on_user_id"

  create_table "subscriptions", :force => true do |t|
    t.string   "status"
    t.string   "chargify_subscription_id"
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "subscriptions", ["chargify_subscription_id"], :name => "index_subscriptions_on_chargify_subscription_id", :unique => true
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "contact_number"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "email"
    t.string   "password_digest"
    t.string   "company"
    t.string   "remember_token"
    t.string   "obfuscated_id"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
