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

ActiveRecord::Schema.define(version: 20130824060954) do

  create_table "oden", force: true do |t|
    t.string "name", limit: 45
  end

  create_table "stock", force: true do |t|
    t.integer  "storeId",                     null: false
    t.integer  "odenId",                      null: false
    t.integer  "number",                      null: false
    t.boolean  "available",    default: true, null: false
    t.datetime "entryTime",                   null: false
    t.datetime "recordedTime",                null: false
  end

  add_index "stock", ["entryTime"], name: "IDX_RECORDED", using: :btree

  create_table "stocks", force: true do |t|
    t.integer  "storeId"
    t.integer  "odenId"
    t.integer  "number"
    t.boolean  "available"
    t.datetime "entryTime"
    t.datetime "recordedTime"
  end

end
