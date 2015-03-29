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

ActiveRecord::Schema.define(version: 20150329013939) do

  create_table "junit_outputs", force: :cascade do |t|
    t.string   "output",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "type",       limit: 255, null: false
    t.string   "message",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "messages", ["message"], name: "index_messages_on_message", using: :btree
  add_index "messages", ["type"], name: "index_messages_on_type", using: :btree

  create_table "properties", force: :cascade do |t|
    t.integer  "test_suite_id", limit: 4,   null: false
    t.string   "name",          limit: 255, null: false
    t.string   "value",         limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "properties", ["test_suite_id"], name: "fk_rails_c0219d03f3", using: :btree

  create_table "test_cases", force: :cascade do |t|
    t.integer  "test_suite_id", limit: 4,   null: false
    t.string   "name",          limit: 255, null: false
    t.string   "classname",     limit: 255, null: false
    t.integer  "time",          limit: 4,   null: false
    t.string   "status",        limit: 255, null: false
    t.integer  "message_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "test_cases", ["classname"], name: "index_test_cases_on_classname", using: :btree
  add_index "test_cases", ["message_id"], name: "fk_rails_b0a4779bdf", using: :btree
  add_index "test_cases", ["name"], name: "index_test_cases_on_name", using: :btree
  add_index "test_cases", ["status"], name: "index_test_cases_on_status", using: :btree
  add_index "test_cases", ["test_suite_id"], name: "fk_rails_8e2ae484ea", using: :btree

  create_table "test_suites", force: :cascade do |t|
    t.string   "name",            limit: 255, null: false
    t.datetime "timestamp",                   null: false
    t.string   "hostname",        limit: 255, null: false
    t.integer  "time",            limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "junit_output_id", limit: 4
  end

  add_index "test_suites", ["junit_output_id"], name: "fk_rails_bae73fabcd", using: :btree
  add_index "test_suites", ["name"], name: "index_test_suites_on_name", using: :btree

  add_foreign_key "properties", "test_suites"
  add_foreign_key "test_cases", "messages"
  add_foreign_key "test_cases", "test_suites"
  add_foreign_key "test_suites", "junit_outputs"
end
