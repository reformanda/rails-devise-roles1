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

ActiveRecord::Schema.define(version: 20160423021018) do

  create_table "nomination_types", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "nominations", force: :cascade do |t|
    t.string   "unit_commander_title"
    t.string   "unit_commander_first_name"
    t.string   "unit_commander_last_name"
    t.string   "unit_commander_suffix"
    t.string   "unit_commander_phone"
    t.string   "unit_commander_email"
    t.string   "unit_commander_organization"
    t.string   "nominating_official_title"
    t.string   "nominating_official_first_name"
    t.string   "nominating_official_last_name"
    t.string   "nominating_official_suffix"
    t.string   "nominating_official_phone"
    t.string   "nominating_official_email"
    t.string   "nominating_point_of_contact_title"
    t.string   "nominating_point_of_contact_first_name"
    t.string   "nominating_point_of_contact_last_name"
    t.string   "nominating_point_of_contact_suffix"
    t.string   "nominating_point_of_contact_phone"
    t.string   "nominating_point_of_contact_email"
    t.string   "nominating_point_of_contact_organization_address_1"
    t.string   "nominating_point_of_contact_organization_address_2"
    t.string   "nominating_point_of_contact_city"
    t.string   "nominating_point_of_contact_state"
    t.string   "nominating_point_of_contact_zip"
    t.string   "nominating_point_of_contact_country"
    t.string   "award"
    t.string   "nominee_title"
    t.string   "nominee_first_name"
    t.string   "nominee_last_name"
    t.string   "nominee_suffix"
    t.string   "nominee_position_title"
    t.string   "nominee_email"
    t.string   "nominee_organization"
    t.string   "nominee_command"
    t.string   "nominee_team_name"
    t.string   "endorsement_letter"
    t.string   "submission_form"
    t.string   "photo_a"
    t.string   "photo_b"
    t.string   "nomination_type"
    t.string   "nomination_year"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
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
