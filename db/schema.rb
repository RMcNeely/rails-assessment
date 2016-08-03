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

ActiveRecord::Schema.define(version: 20160803144646) do

  create_table "assessment_contributers", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "assessment_id"
    t.integer  "user_id"
  end

  create_table "assessment_skills", force: :cascade do |t|
    t.integer  "assessment_id"
    t.integer  "skill_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "strength"
  end

  create_table "assessments", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "name"
    t.text     "link"
    t.integer  "user_id"
    t.boolean  "completed",  default: false
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "name"
    t.integer  "assessment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",                                     null: false
    t.string   "encrypted_password",     default: "",                                     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "provider"
    t.string   "uid"
    t.text     "bio",                    default: "Add some details about yourself here"
    t.string   "status",                 default: "Learn. Love. Code."
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
