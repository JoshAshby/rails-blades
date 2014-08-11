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

ActiveRecord::Schema.define(version: 20140810154146) do

  create_table "shaving_brands", force: true do |t|
    t.string   "name"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "shaving_brands", ["products_id"], name: "index_shaving_brands_on_products_id"

  create_table "shaving_products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "brand_id"
    t.integer  "reviews_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "shaving_products", ["brand_id"], name: "index_shaving_products_on_brand_id"
  add_index "shaving_products", ["reviews_id"], name: "index_shaving_products_on_reviews_id"
  add_index "shaving_products", ["type_id"], name: "index_shaving_products_on_type_id"

  create_table "shaving_reviews", force: true do |t|
    t.text     "comments"
    t.integer  "overall_rating"
    t.integer  "face_feel"
    t.integer  "shaving_feel"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "reviewed_on"
  end

  add_index "shaving_reviews", ["product_id"], name: "index_shaving_reviews_on_product_id"

  create_table "shaving_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shaving_types", ["products_id"], name: "index_shaving_types_on_products_id"

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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
