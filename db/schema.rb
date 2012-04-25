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

ActiveRecord::Schema.define(:version => 20110418211329) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.decimal  "balance"
    t.string   "bank_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], :name => "index_accounts_on_user_id", :unique => true

  create_table "categories", :force => true do |t|
    t.integer  "account_id"
    t.integer  "category_type_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["account_id"], :name => "index_categories_on_account_id", :unique => true
  add_index "categories", ["category_type_id"], :name => "index_categories_on_category_type_id", :unique => true

  create_table "category_matchers", :force => true do |t|
    t.integer  "category_id"
    t.string   "matcher"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_types", :force => true do |t|
    t.integer  "account_id"
    t.string   "name"
    t.boolean  "global",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_types", ["account_id"], :name => "index_category_types_on_account_id"

  create_table "transactions", :force => true do |t|
    t.integer  "account_id"
    t.date     "posted_at"
    t.decimal  "amount"
    t.string   "name"
    t.string   "fitid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transaction_type"
    t.integer  "category_id"
  end

  add_index "transactions", ["account_id"], :name => "index_transactions_on_account_id"
  add_index "transactions", ["category_id"], :name => "index_transactions_on_category_id", :unique => true
  add_index "transactions", ["transaction_type"], :name => "index_transactions_on_transaction_type"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
