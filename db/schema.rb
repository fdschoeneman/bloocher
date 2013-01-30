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

ActiveRecord::Schema.define(:version => 20130117031959) do

  create_table "ownerships", :force => true do |t|
    t.integer  "owner_id"
    t.integer  "producer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ownerships", ["owner_id", "producer_id"], :name => "index_ownerships_on_owner_id_and_producer_id", :unique => true
  add_index "ownerships", ["owner_id"], :name => "index_ownerships_on_owner_id"
  add_index "ownerships", ["producer_id"], :name => "index_ownerships_on_producer_id"

  create_table "producers", :force => true do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "name"
    t.string   "subdomain"
    t.string   "web_address"
    t.string   "public_email"
    t.string   "phone"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "producers", ["city"], :name => "index_producers_on_city"
  add_index "producers", ["name"], :name => "index_producers_on_name"
  add_index "producers", ["state"], :name => "index_producers_on_state"
  add_index "producers", ["subdomain"], :name => "index_producers_on_subdomain"

  create_table "reviews", :force => true do |t|
    t.integer  "rating"
    t.integer  "reviewer_id"
    t.integer  "wine_id"
    t.text     "content"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "reviews", ["rating"], :name => "index_reviews_on_rating"
  add_index "reviews", ["reviewer_id"], :name => "index_reviews_on_reviewer_id"
  add_index "reviews", ["wine_id"], :name => "index_reviews_on_wine_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "winemaker_oeuvres", :force => true do |t|
    t.integer  "winemaker_id"
    t.integer  "wine_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "winemaker_oeuvres", ["wine_id"], :name => "index_winemaker_oeuvres_on_wine_id"

  create_table "wineries", :force => true do |t|
    t.string   "name"
    t.integer  "producer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "wineries", ["name"], :name => "index_wineries_on_name", :unique => true

  create_table "wines", :force => true do |t|
    t.integer  "vintage"
    t.integer  "cases_produced"
    t.integer  "days_in_oak"
    t.integer  "winery_id"
    t.integer  "lay_down_until"
    t.integer  "drink_before"
    t.boolean  "acid_added"
    t.datetime "bottled_on"
    t.datetime "released_on"
    t.string   "name"
    t.text     "winemaker_notes"
    t.decimal  "ph",                        :precision => 3, :scale => 2
    t.decimal  "residual_sugar",            :precision => 3, :scale => 4
    t.decimal  "alcohol",                   :precision => 3, :scale => 4
    t.decimal  "new_french_oak",            :precision => 3, :scale => 3
    t.decimal  "one_yr_old_french_oak"
    t.decimal  "two_yr_old_french_oak"
    t.decimal  "three_yr_old_french_oak"
    t.decimal  "new_american_oak"
    t.decimal  "one_yr_old_american_oak"
    t.decimal  "two_yr_old_american_oak"
    t.decimal  "three_yr_old_american_oak"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "wines", ["name"], :name => "index_wines_on_name"
  add_index "wines", ["vintage"], :name => "index_wines_on_vintage"

end
