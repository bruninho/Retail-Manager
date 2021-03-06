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

ActiveRecord::Schema.define(version: 20150412134955) do

  create_table "employees", force: true do |t|
    t.string   "pps_no"
    t.string   "fname"
    t.string   "lname"
    t.date     "dob"
    t.text     "address"
    t.string   "ph_number"
    t.float    "basic_rop"
    t.float    "sunday_bh_rop"
    t.string   "email"
    t.date     "date_joined"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "messages", force: true do |t|
    t.text     "subject"
    t.text     "content"
    t.integer  "receiver"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "read",       default: false, null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "pages", force: true do |t|
    t.integer  "special_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "payrolls", force: true do |t|
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "sales", force: true do |t|
    t.float    "total"
    t.float    "profit"
    t.float    "credit"
    t.float    "cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "difference"
    t.integer  "user_id"
  end

  add_index "sales", ["user_id"], name: "index_sales_on_user_id"

  create_table "specials", force: true do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timesheets", force: true do |t|
    t.integer  "payroll_id"
    t.integer  "employee_id"
    t.float    "basic_hours"
    t.float    "sunday_hours"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
