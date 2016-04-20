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

ActiveRecord::Schema.define(version: 20160420021725) do

  create_table "nominations", force: :cascade do |t|
    t.string   "ucho_title"
    t.string   "ucho_first"
    t.string   "ucho_last"
    t.string   "ucho_suffix"
    t.string   "ucho_phone"
    t.string   "ucho_email"
    t.string   "ucho_organization"
    t.string   "nomoff_title"
    t.string   "nomoff_first"
    t.string   "nomoff_last"
    t.string   "nomoff_suffix"
    t.string   "nomoff_phone"
    t.string   "nomoff_email"
    t.string   "poc_title"
    t.string   "poc_first"
    t.string   "poc_last"
    t.string   "poc_suffix"
    t.string   "poc_phone"
    t.string   "poc_email"
    t.string   "poc_org_address_1"
    t.string   "poc_org_address_2"
    t.string   "poc_city"
    t.string   "poc_state"
    t.string   "poc_zip"
    t.string   "poc_country"
    t.string   "award"
    t.string   "nominee_title"
    t.string   "nominee_first"
    t.string   "nominee_last"
    t.string   "nominee_suffix"
    t.string   "nominee_position_title"
    t.string   "nominee_email"
    t.string   "nominee_organization"
    t.string   "nominee_command"
    t.string   "endorsement_letter"
    t.string   "submission_form"
    t.string   "photo_a"
    t.string   "photo_b"
    t.string   "nomination_type"
    t.string   "nomination_year"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
