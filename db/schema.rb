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

ActiveRecord::Schema.define(version: 20150624212244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "gift_id"
    t.decimal  "amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "stripeToken"
    t.string   "stripeTokenType"
    t.string   "stripeEmail"
  end

  create_table "gifts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price"
    t.string   "gift_url"
    t.datetime "due_date"
    t.string   "recipient"
    t.integer  "user_id"
    t.string   "hashed_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "password"
    t.decimal  "current_total"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "publishable_key"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_code"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
