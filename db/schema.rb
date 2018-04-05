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

ActiveRecord::Schema.define(version: 20180405131504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.string "organization"
    t.string "location_id"
    t.string "location_name"
    t.string "location_type"
    t.integer "huc_8"
    t.integer "drainage_area_value"
    t.string "drainage_area_unit_code"
    t.integer "contributing_drainage_area_value"
    t.string "contributing_drainage_area_unit_code"
    t.string "latitude"
    t.string "longitude"
    t.string "horizontal_datum"
    t.string "vertical_datum"
    t.string "state_code"
    t.string "county_code"
    t.string "aquifer_name"
    t.string "formation_type"
    t.string "aquifer_type"
    t.string "construction_date"
    t.string "well_depth_value"
    t.string "well_depth_unit_code"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "company"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
  end

end
