# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_12_164100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", primary_key: "attendee_id", id: :bigint, default: -> { "nextval('attendees_id_seq'::regclass)" }, force: :cascade do |t|
    t.boolean "attended"
    t.boolean "rsvp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.bigint "member_id"
  end

  create_table "events", primary_key: "event_id", id: :bigint, default: -> { "nextval('events_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.time "start_time"
    t.time "end_time"
    t.date "date"
    t.string "description"
    t.integer "capacity"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_roles", primary_key: "member_role_id", id: :integer, default: nil, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "member_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", primary_key: "member_id", id: :bigint, default: -> { "nextval('members_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "points"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_joined"
    t.string "degree"
    t.string "food_allergies"
    t.string "res_topic"
    t.string "res_lab"
    t.string "res_pioneer"
    t.string "res_description"
    t.text "area_of_study"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "description"
    t.time "send_time"
    t.date "send_date"
    t.boolean "is_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "role_id"
    t.string "name"
    t.string "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendees", "events", primary_key: "event_id"
  add_foreign_key "member_roles", "members"
  add_foreign_key "member_roles", "roles"
  add_foreign_key "notifications", "events", primary_key: "event_id"
end
