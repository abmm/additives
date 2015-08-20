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

ActiveRecord::Schema.define(version: 20150817153349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additives", force: :cascade do |t|
    t.string   "code",              limit: 6,   null: false
    t.string   "name",              limit: 100, null: false
    t.integer  "classification_id",             null: false
    t.integer  "origin_id",                     null: false
    t.string   "description",       limit: 400, null: false
    t.string   "use",               limit: 400
    t.string   "effects",           limit: 400
    t.integer  "toxicity",                      null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.integer  "classification_id"
    t.string   "name",              limit: 100, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "origins", force: :cascade do |t|
    t.integer  "origin_id"
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 100,              null: false
    t.string   "email",                  limit: 50,               null: false
    t.string   "phone",                  limit: 30,               null: false
    t.string   "api_token",                                       null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
