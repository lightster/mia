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

ActiveRecord::Schema.define(version: 20140424052343) do

  create_table "categories", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "time_increment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], name: "index_categories_on_user_id"

  create_table "tags", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_logs", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "description"
    t.date     "date"
    t.integer  "rounded_minutes"
    t.integer  "actual_seconds"
    t.boolean  "timer_enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "time_logs", ["category_id"], name: "index_time_logs_on_category_id"
  add_index "time_logs", ["user_id"], name: "index_time_logs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
