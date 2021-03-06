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

ActiveRecord::Schema.define(version: 2018_07_24_110521) do

  create_table "attractions", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "hours"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attractions_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "attraction_id"
    t.index ["attraction_id"], name: "index_attractions_trips_on_attraction_id"
    t.index ["trip_id"], name: "index_attractions_trips_on_trip_id"
  end

  create_table "travelers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.integer "budget"
    t.string "nationality"
    t.string "interests"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.integer "traveler_id"
    t.integer "attraction_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attraction_id"], name: "index_trips_on_attraction_id"
    t.index ["traveler_id"], name: "index_trips_on_traveler_id"
  end

end
