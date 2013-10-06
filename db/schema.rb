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

ActiveRecord::Schema.define(version: 20130512032335) do

  create_table "pastes", force: true do |t|
    t.string   "ip",         limit: 50,  null: false
    t.text     "paste",                  null: false
    t.string   "paste_hash", limit: 150, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "key"
    t.string   "secret"
  end

  add_index "pastes", ["ip", "paste_hash"], name: "index_pastes_on_ip_and_hash", unique: true, using: :btree
  add_index "pastes", ["secret"], name: "index_pastes_on_secret", using: :btree

end
