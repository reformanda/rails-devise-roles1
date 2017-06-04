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

ActiveRecord::Schema.define(version: 20170425021134) do

  create_table "award_options", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.integer  "nomination_type_id", limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "award_options", ["nomination_type_id"], name: "index_award_options_on_nomination_type_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string   "description",                limit: 255
    t.string   "start_date",                 limit: 255
    t.string   "end_date",                   limit: 255
    t.integer  "nomination_type_id",         limit: 4
    t.integer  "score_type_id",              limit: 4
    t.text     "users_list",                 limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "combined_submission_packet", limit: 255
    t.string   "year",                       limit: 255
  end

  add_index "boards", ["nomination_type_id"], name: "index_boards_on_nomination_type_id", using: :btree
  add_index "boards", ["score_type_id"], name: "index_boards_on_score_type_id", using: :btree

  create_table "nomination_types", force: :cascade do |t|
    t.string   "year",                      limit: 255
    t.string   "code",                      limit: 255
    t.string   "title",                     limit: 255
    t.text     "description",               limit: 65535
    t.string   "awards_announcement",       limit: 255
    t.string   "implementing_instructions", limit: 255
    t.string   "submission_form",           limit: 255
    t.string   "award_narrative",           limit: 255
    t.string   "guidelines",                limit: 255
    t.string   "nomination_end_date",       limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "award_years_list",          limit: 65535
    t.boolean  "remove_team_name"
  end

  create_table "nominations", force: :cascade do |t|
    t.string   "unit_commander_title",                               limit: 255
    t.string   "unit_commander_first_name",                          limit: 255
    t.string   "unit_commander_last_name",                           limit: 255
    t.string   "unit_commander_suffix",                              limit: 255
    t.string   "unit_commander_phone",                               limit: 255
    t.string   "unit_commander_email",                               limit: 255
    t.string   "unit_commander_organization",                        limit: 255
    t.string   "nominating_official_title",                          limit: 255
    t.string   "nominating_official_first_name",                     limit: 255
    t.string   "nominating_official_last_name",                      limit: 255
    t.string   "nominating_official_suffix",                         limit: 255
    t.string   "nominating_official_phone",                          limit: 255
    t.string   "nominating_official_email",                          limit: 255
    t.string   "nominating_point_of_contact_title",                  limit: 255
    t.string   "nominating_point_of_contact_first_name",             limit: 255
    t.string   "nominating_point_of_contact_last_name",              limit: 255
    t.string   "nominating_point_of_contact_suffix",                 limit: 255
    t.string   "nominating_point_of_contact_phone",                  limit: 255
    t.string   "nominating_point_of_contact_email",                  limit: 255
    t.string   "nominating_point_of_contact_organization_address_1", limit: 255
    t.string   "nominating_point_of_contact_organization_address_2", limit: 255
    t.string   "nominating_point_of_contact_city",                   limit: 255
    t.string   "nominating_point_of_contact_state",                  limit: 255
    t.string   "nominating_point_of_contact_zip",                    limit: 255
    t.string   "nominating_point_of_contact_country",                limit: 255
    t.string   "nominee_title",                                      limit: 255
    t.string   "nominee_first_name",                                 limit: 255
    t.string   "nominee_last_name",                                  limit: 255
    t.string   "nominee_suffix",                                     limit: 255
    t.string   "nominee_position_title",                             limit: 255
    t.string   "nominee_email",                                      limit: 255
    t.string   "nominee_organization",                               limit: 255
    t.string   "nominee_command",                                    limit: 255
    t.string   "nominee_team_name",                                  limit: 255
    t.string   "endorsement_letter",                                 limit: 255
    t.string   "submission_form_award_narrative",                    limit: 255
    t.string   "nominee_organization_logo",                          limit: 255
    t.string   "nomination_year",                                    limit: 255
    t.integer  "nomination_type_id",                                 limit: 4
    t.integer  "award_option_id",                                    limit: 4
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "status",                                             limit: 4
    t.string   "submission_word_document",                           limit: 255
    t.string   "submission_pdf",                                     limit: 255
    t.string   "submission_packet",                                  limit: 255
    t.string   "nominee_photograph_one",                             limit: 255
    t.string   "nominee_photograph_two",                             limit: 255
    t.string   "additional_supporting_graphics",                     limit: 255
  end

  add_index "nominations", ["award_option_id"], name: "index_nominations_on_award_option_id", using: :btree
  add_index "nominations", ["nomination_type_id"], name: "index_nominations_on_nomination_type_id", using: :btree

  create_table "score_types", force: :cascade do |t|
    t.string   "description",  limit: 255
    t.text     "instructions", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer "user_id",        limit: 4
    t.integer "board_id",       limit: 4
    t.integer "nomination_id",  limit: 4
    t.integer "score_1",        limit: 4
    t.integer "score_2",        limit: 4
    t.integer "score_3",        limit: 4
    t.integer "score_4",        limit: 4
    t.integer "score_5",        limit: 4
    t.integer "score_6",        limit: 4
    t.integer "score_7",        limit: 4
    t.integer "score_8",        limit: 4
    t.integer "score_9",        limit: 4
    t.integer "score_total",    limit: 4
    t.text    "score_comments", limit: 65535
  end

  add_index "scores", ["board_id"], name: "index_scores_on_board_id", using: :btree
  add_index "scores", ["nomination_id"], name: "index_scores_on_nomination_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
    t.text     "nomination_types_list",  limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "award_options", "nomination_types"
  add_foreign_key "boards", "nomination_types"
  add_foreign_key "boards", "score_types"
  add_foreign_key "nominations", "award_options"
  add_foreign_key "nominations", "nomination_types"
  add_foreign_key "scores", "boards"
  add_foreign_key "scores", "nominations"
end
