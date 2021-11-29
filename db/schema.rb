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

ActiveRecord::Schema.define(version: 2021_11_29_164128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conflicts", force: :cascade do |t|
    t.string "conflict_type"
    t.date "date"
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_conflicts_on_family_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.text "comment"
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["family_id"], name: "index_contacts_on_family_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "conflict_id"
    t.bigint "family_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "family_member_id"
    t.string "identifier"
    t.string "contact"
    t.index ["conflict_id"], name: "index_events_on_conflict_id"
    t.index ["family_id"], name: "index_events_on_family_id"
    t.index ["family_member_id"], name: "index_events_on_family_member_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "family_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "family_id", null: false
    t.boolean "admin"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.index ["family_id"], name: "index_family_members_on_family_id"
    t.index ["user_id"], name: "index_family_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conflicts", "families"
  add_foreign_key "contacts", "families"
  add_foreign_key "events", "conflicts"
  add_foreign_key "events", "families"
  add_foreign_key "events", "family_members"
  add_foreign_key "family_members", "families"
  add_foreign_key "family_members", "users"
end
