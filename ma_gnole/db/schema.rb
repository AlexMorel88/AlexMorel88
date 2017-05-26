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

ActiveRecord::Schema.define(version: 20170525164547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availibilities", force: :cascade do |t|
    t.integer  "price"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_availibilities_on_place_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "price"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_bookings_on_place_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "place_reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["place_id"], name: "index_place_reviews_on_place_id", using: :btree
    t.index ["user_id"], name: "index_place_reviews_on_user_id", using: :btree
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "description"
    t.string   "photo"
    t.integer  "nbr_person"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "price"
    t.index ["user_id"], name: "index_places_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "user_reviews", force: :cascade do |t|
    t.integer  "rating"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["place_id"], name: "index_user_reviews_on_place_id", using: :btree
    t.index ["user_id"], name: "index_user_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availibilities", "places"
  add_foreign_key "bookings", "places"
  add_foreign_key "bookings", "users"
  add_foreign_key "place_reviews", "places"
  add_foreign_key "place_reviews", "users"
  add_foreign_key "places", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "user_reviews", "places"
  add_foreign_key "user_reviews", "users"
end
