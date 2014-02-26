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

ActiveRecord::Schema.define(version: 20140220205859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["owner_type", "owner_id"], name: "index_cart_items_on_owner_type_and_owner_id", using: :btree

  create_table "carts", force: true do |t|
    t.integer "status"
    t.integer "user_id"
  end

  add_index "carts", ["user_id", "status"], name: "index_carts_on_user_id_and_status", using: :btree
  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "product_items", force: true do |t|
    t.integer  "product_id"
    t.string   "instagram_image_id"
    t.string   "instagram_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_items", ["product_id"], name: "index_product_items_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_type"
    t.integer  "quantity"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["user_id", "product_type", "status"], name: "index_products_on_user_id_and_product_type_and_status", using: :btree
  add_index "products", ["user_id", "product_type"], name: "index_products_on_user_id_and_product_type", using: :btree
  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "username"
    t.string   "name"
    t.string   "image"
    t.string   "token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
