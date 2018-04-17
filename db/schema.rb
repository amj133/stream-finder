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

ActiveRecord::Schema.define(version: 20180417191018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_station_projects", force: :cascade do |t|
    t.bigint "favorite_station_id"
    t.bigint "project_id"
    t.index ["favorite_station_id"], name: "index_favorite_station_projects_on_favorite_station_id"
    t.index ["project_id"], name: "index_favorite_station_projects_on_project_id"
  end

  create_table "favorite_stations", force: :cascade do |t|
    t.string "org_id"
    t.string "type_of"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.float "drainage_area"
    t.string "drainage_area_units"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "huc"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "stream_station_projects", force: :cascade do |t|
    t.bigint "stream_station_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_stream_station_projects_on_project_id"
    t.index ["stream_station_id"], name: "index_stream_station_projects_on_stream_station_id"
  end

  create_table "stream_stations", force: :cascade do |t|
    t.string "org_id"
    t.string "name"
    t.string "huc"
    t.string "type_of"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.float "drainage_area"
    t.string "drainage_area_units"
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

  add_foreign_key "favorite_station_projects", "favorite_stations"
  add_foreign_key "favorite_station_projects", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "stream_station_projects", "projects"
  add_foreign_key "stream_station_projects", "stream_stations"
end
