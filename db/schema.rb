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

ActiveRecord::Schema.define(version: 2018_07_13_005332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "title"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "air_acceleration_base", precision: 3, scale: 2
    t.decimal "air_acceleration_additional", precision: 5, scale: 4
    t.decimal "air_acceleration_max", precision: 5, scale: 4
    t.decimal "air_friction", precision: 4, scale: 3
    t.decimal "air_speed", precision: 3, scale: 2
    t.decimal "fall_speed_base", precision: 3, scale: 2
    t.decimal "fall_speed_fast", precision: 3, scale: 2
    t.decimal "gravity", precision: 4, scale: 3
    t.integer "weight"
  end

  create_table "jumps", force: :cascade do |t|
    t.bigint "character_id"
    t.integer "jumpsquat"
    t.integer "max_jumps"
    t.integer "landing_lag"
    t.decimal "jump_force", precision: 3, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_jumps_on_character_id"
  end

end
