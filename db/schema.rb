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

ActiveRecord::Schema.define(version: 20161211231614) do

  create_table "animals", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "appointments", force: true do |t|
    t.text     "description"
    t.decimal  "amount"
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "doctor_id"
  end

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.text     "address"
    t.integer  "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.datetime "born_at"
    t.text     "observations"
    t.text     "pet_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
    t.integer  "animal_id"
    t.string   "breed"
  end

end
