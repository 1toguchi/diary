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

ActiveRecord::Schema.define(version: 20160808175046) do

  create_table "kijis", force: :cascade do |t|
    t.integer  "member_id",   limit: 4,                       null: false
    t.string   "title",       limit: 255,                     null: false
    t.text     "body",        limit: 65535,                   null: false
    t.datetime "released_at"
    t.string   "status",      limit: 255,   default: "draft", null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "kijis", ["member_id"], name: "index_kijis_on_member_id", using: :btree

  create_table "member_images", force: :cascade do |t|
    t.integer  "member_id",    limit: 4,     null: false
    t.binary   "data",         limit: 65535
    t.string   "content_type", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "member_images", ["member_id"], name: "index_member_images_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255,              null: false
    t.integer  "gender",                 limit: 4
    t.date     "birthday"
    t.string   "image",                  limit: 255
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "member_id",  limit: 4, null: false
    t.integer  "kiji_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "votes", ["kiji_id"], name: "index_votes_on_kiji_id", using: :btree
  add_index "votes", ["member_id"], name: "index_votes_on_member_id", using: :btree

end
