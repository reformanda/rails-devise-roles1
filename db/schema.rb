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

ActiveRecord::Schema.define(version: 20160707020946) do

  create_table "award_options", force: :cascade do |t|
    t.string   "name"
    t.integer  "nomination_type_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "award_options", ["nomination_type_id"], name: "index_award_options_on_nomination_type_id"

  create_table "boards", force: :cascade do |t|
    t.string   "description"
    t.string   "start_date"
    t.string   "end_date"
    t.integer  "nomination_type_id"
    t.integer  "score_type_id"
    t.text     "users_list"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "combined_submission_packet"
  end

  add_index "boards", ["nomination_type_id"], name: "index_boards_on_nomination_type_id"
  add_index "boards", ["score_type_id"], name: "index_boards_on_score_type_id"

  create_table "nomination_types", force: :cascade do |t|
    t.string   "year"
    t.string   "code"
    t.string   "title"
    t.text     "description"
    t.string   "awards_announcement"
    t.string   "implementing_instructions"
    t.string   "submission_form"
    t.string   "award_narrative"
    t.string   "guidelines"
    t.string   "nomination_end_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "submission_form_award_narrative"
    t.string   "nominee_organization_logo"
    t.string   "nomination_year"
    t.integer  "nomination_type_id"
    t.integer  "award_option_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "status"
    t.string   "submission_word_document"
    t.string   "submission_pdf"
    t.string   "submission_packet"
    t.string   "nominee_photograph_one"
    t.string   "nominee_photograph_two"
  end

  add_index "nominations", ["award_option_id"], name: "index_nominations_on_award_option_id"
  add_index "nominations", ["nomination_type_id"], name: "index_nominations_on_nomination_type_id"

  create_table "score_types", force: :cascade do |t|
    t.string   "description"
    t.text     "instructions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.integer "nomination_id"
    t.integer "score_1"
    t.integer "score_2"
    t.integer "score_3"
    t.integer "score_4"
    t.integer "score_5"
    t.integer "score_6"
    t.integer "score_7"
    t.integer "score_8"
    t.integer "score_9"
    t.integer "score_total"
    t.text    "score_comments"
  end

  add_index "scores", ["board_id"], name: "index_scores_on_board_id"
  add_index "scores", ["nomination_id"], name: "index_scores_on_nomination_id"

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
    t.text     "nomination_types_list"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
