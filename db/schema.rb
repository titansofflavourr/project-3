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


ActiveRecord::Schema.define(version: 20150628210835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.integer "user_id",                             null: false
    t.integer "quiz_id",                             null: false
    t.integer "student_score"
    t.string  "comment"
    t.string  "status",        default: "submitted"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string  "option",      null: false
    t.string  "key",         null: false
  end

  create_table "cohorts", force: :cascade do |t|
    t.integer  "course_id",                 null: false
    t.string   "name"
    t.date     "start_date",                null: false
    t.date     "end_date",                  null: false
    t.boolean  "is_active",  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cohorts_users", id: false, force: :cascade do |t|
    t.integer "user_id",   null: false
    t.integer "cohort_id", null: false
  end

  add_index "cohorts_users", ["cohort_id"], name: "index_cohorts_users_on_cohort_id", using: :btree
  add_index "cohorts_users", ["user_id"], name: "index_cohorts_users_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "number",                             null: false
    t.string   "prompt",                             null: false
    t.boolean  "is_multiple_choice", default: false, null: false
    t.string   "answer_key"
    t.integer  "max_points",         default: 1,     null: false
    t.integer  "quiz_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "instructions"
    t.boolean  "is_active",     default: true, null: false
    t.integer  "cohort_id",                    null: false
    t.integer  "user_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_assigned"
    t.integer  "total_points"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "question_id", null: false
    t.string   "answer"
    t.integer  "grade"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "is_instructor",          default: false, null: false
    t.string   "f_name",                                 null: false
    t.string   "l_name",                                 null: false
    t.string   "email",                                  null: false
    t.string   "password_digest",                        null: false
    t.boolean  "is_active",              default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree

end
