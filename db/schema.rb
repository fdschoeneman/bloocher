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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130923015122) do

  create_table "account_activations", force: true do |t|
    t.integer  "account_id"
    t.integer  "activation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", force: true do |t|
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.string   "subdomain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["accountable_id"], name: "index_accounts_on_accountable_id", unique: true, using: :btree
  add_index "accounts", ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id", unique: true, using: :btree
  add_index "accounts", ["accountable_type"], name: "index_accounts_on_accountable_type", unique: true, using: :btree
  add_index "accounts", ["subdomain"], name: "index_accounts_on_subdomain", unique: true, using: :btree

  create_table "accounts_activations", force: true do |t|
    t.integer  "account_id"
    t.integer  "activation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts_admins", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "public_phone"
    t.string   "public_email"
    t.string   "public_url"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appellations", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.string   "map"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appellations", ["name", "type"], name: "index_appellations_on_name_and_type", unique: true, using: :btree

  create_table "appellations_vineyards", force: true do |t|
    t.integer  "vineyard_id"
    t.integer  "appellation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appellations_vineyards", ["vineyard_id", "appellation_id"], name: "index_appellations_vineyards_on_vineyard_id_and_appellation_id", unique: true, using: :btree

  create_table "authentications", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carousels", force: true do |t|
    t.string   "carousable_type"
    t.integer  "carousable_id"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certifications", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "certifications_producers", force: true do |t|
    t.integer  "producer_id"
    t.integer  "certification_id"
    t.date     "certified_since"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fruit_lots", force: true do |t|
    t.decimal  "brix"
    t.decimal  "weight"
    t.date     "harvest_date"
    t.integer  "wine_id"
    t.integer  "vineyard_vintage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.text     "description"
    t.string   "content_type"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.boolean  "active"
    t.string   "slug"
    t.integer  "user_id"
    t.string   "file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.integer  "user_id"
    t.integer  "positionable_id"
    t.string   "positionable_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["title", "user_id"], name: "index_positions_on_title_and_user_id", using: :btree

  create_table "producers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "producers", ["name"], name: "index_producers_on_name", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.integer  "reviewer_id"
    t.integer  "wine_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["rating"], name: "index_reviews_on_rating", using: :btree
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id", using: :btree
  add_index "reviews", ["wine_id"], name: "index_reviews_on_wine_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "showcases", force: true do |t|
    t.integer  "sommelier_id"
    t.string   "version"
    t.string   "title"
    t.text     "description"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showcases_wines", force: true do |t|
    t.integer  "showcase_id"
    t.integer  "wine_id"
    t.integer  "blurb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "bio"
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "vineyard_vintages", force: true do |t|
    t.integer  "vineyard_id"
    t.integer  "growing_degree_days"
    t.integer  "days_above_100"
    t.date     "bud_break"
    t.date     "bloom_date"
    t.date     "veraison"
    t.date     "last_frost"
    t.integer  "days_of_frost"
    t.decimal  "average_yearly_rel_hum"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vineyards", force: true do |t|
    t.integer  "producer_id"
    t.integer  "vineyard_parent_id"
    t.integer  "appellation_id"
    t.string   "topo_aspect"
    t.integer  "topo_slope"
    t.integer  "topo_elevation"
    t.string   "soil_composition"
    t.string   "soil_drainage"
    t.integer  "soil_depth"
    t.decimal  "soil_fertility",      precision: 3, scale: 2
    t.integer  "soil_water_capacity"
    t.string   "climate"
    t.string   "name"
    t.decimal  "soil_ph",             precision: 3, scale: 2
    t.string   "rootstock"
    t.string   "clone"
    t.string   "nursery"
    t.string   "varietal"
    t.string   "irrigation"
    t.integer  "planted_on"
    t.integer  "grafted_on"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vineyards", ["appellation_id"], name: "index_vineyards_on_appellation_id", using: :btree
  add_index "vineyards", ["name"], name: "index_vineyards_on_name", using: :btree

  create_table "wine_fruit_lots", force: true do |t|
    t.integer  "wine_id"
    t.integer  "fruit_lot_id"
    t.integer  "percent_of_wine"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wineries", force: true do |t|
    t.string   "name"
    t.integer  "producer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wineries", ["name"], name: "index_wineries_on_name", unique: true, using: :btree

  create_table "wines", force: true do |t|
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
    t.decimal  "ph"
    t.decimal  "residual_sugar"
    t.decimal  "alcohol"
    t.decimal  "new_french_oak"
    t.decimal  "one_yr_old_french_oak"
    t.decimal  "two_yr_old_french_oak"
    t.decimal  "three_yr_old_french_oak"
    t.decimal  "new_american_oak"
    t.decimal  "one_yr_old_american_oak"
    t.decimal  "two_yr_old_american_oak"
    t.decimal  "three_yr_old_american_oak"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  add_index "wines", ["name"], name: "index_wines_on_name", using: :btree
  add_index "wines", ["vintage"], name: "index_wines_on_vintage", using: :btree

end
