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

ActiveRecord::Schema.define(version: 20160616202254) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "position"
    t.string  "arrival_time"
    t.string  "departure_time"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "fio"
    t.string   "passport"
    t.integer  "railway_stations_route_id"
  end

  add_index "tickets", ["railway_stations_route_id"], name: "index_tickets_on_railway_stations_route_id"
  add_index "tickets", ["train_id"], name: "index_tickets_on_train_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
    t.boolean  "from_head"
  end

  create_table "users", force: :cascade do |t|
    t.string   "family"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vagons", force: :cascade do |t|
    t.integer "train_id"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.string  "type"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.integer "sitting_seats"
    t.integer "number"
  end

  add_index "vagons", ["train_id"], name: "index_vagons_on_train_id"

end
