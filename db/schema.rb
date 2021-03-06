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

ActiveRecord::Schema.define(version: 20130923233747) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.string   "color",      default: "black"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "consumable_objects", force: true do |t|
    t.integer  "consumable_type_id"
    t.decimal  "amount",             precision: 5, scale: 2
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "consumable_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color",      default: "black"
  end

  create_table "consumed_units", force: true do |t|
    t.integer  "consumable_type_id"
    t.decimal  "amount",               precision: 5, scale: 2
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "consumable_object_id"
  end

  add_index "consumed_units", ["consumable_object_id"], name: "index_consumed_units_on_consumable_object_id"

  create_table "dashboards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "widgets"
    t.boolean  "show"
  end

  create_table "rescue_time_charts", force: true do |t|
    t.string   "title"
    t.string   "key"
    t.boolean  "show"
    t.integer  "width"
    t.integer  "height"
    t.text     "script"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.datetime "begin"
    t.datetime "end"
    t.integer  "activity_id"
  end

  add_index "sessions", ["activity_id"], name: "index_sessions_on_activity_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
