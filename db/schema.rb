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

ActiveRecord::Schema.define(version: 20150123041230) do

  create_table "tweets", force: :cascade do |t|
    t.string   "status"
    t.integer  "zombie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vampires", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.integer  "zombie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zombies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "brain"
    t.string   "craving"
    t.boolean  "vegetarian", default: true
    t.boolean  "hungry",     default: true
    t.string   "status"
    t.string   "graveyard"
  end

  create_table "zoogles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end