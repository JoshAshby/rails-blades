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

ActiveRecord::Schema.define(version: 20140803021429) do

  create_table "blades", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blades", ["brand_id"], name: "index_blades_on_brand_id"

  create_table "brands", force: true do |t|
    t.text     "name"
    t.integer  "blades_id"
    t.integer  "soaps_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brands", ["blades_id"], name: "index_brands_on_blades_id"
  add_index "brands", ["soaps_id"], name: "index_brands_on_soaps_id"

  create_table "soaps", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "soaps", ["brand_id"], name: "index_soaps_on_brand_id"

end
