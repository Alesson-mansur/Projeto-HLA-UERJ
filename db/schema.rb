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

ActiveRecord::Schema.define(version: 20180327220403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "boardnums", force: :cascade do |t|
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string "identification"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "boardnum_id"
    t.index ["boardnum_id"], name: "index_boards_on_boardnum_id"
    t.index ["deleted_at"], name: "index_boards_on_deleted_at"
  end

  create_table "dnanums", force: :cascade do |t|
    t.string "code"
    t.string "option"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_id"
    t.string "well"
    t.bigint "exam_id"
    t.bigint "boardnum_id"
    t.bigint "reagent_id"
    t.index ["board_id"], name: "index_dnanums_on_board_id"
    t.index ["boardnum_id"], name: "index_dnanums_on_boardnum_id"
    t.index ["exam_id"], name: "index_dnanums_on_exam_id"
    t.index ["reagent_id"], name: "index_dnanums_on_reagent_id"
  end

  create_table "eletroforeses", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_eletroforeses_on_board_id"
    t.index ["phase_id"], name: "index_eletroforeses_on_phase_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hibrids", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_hibrids_on_board_id"
    t.index ["phase_id"], name: "index_hibrids_on_phase_id"
  end

  create_table "interprets", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_interprets_on_board_id"
    t.index ["phase_id"], name: "index_interprets_on_phase_id"
  end

  create_table "interps", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_interps_on_board_id"
    t.index ["phase_id"], name: "index_interps_on_phase_id"
  end

  create_table "pcrs", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_pcrs_on_board_id"
    t.index ["phase_id"], name: "index_pcrs_on_phase_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "pcr"
    t.string "electro"
    t.string "hibrid"
    t.string "interp"
    t.string "relat"
    t.string "base"
    t.string "negativo"
    t.string "positivo"
    t.text "opt1"
    t.text "opt2"
    t.date "data1"
    t.date "data2"
    t.date "data3"
    t.date "data4"
    t.date "data5"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_phases_on_board_id"
  end

  create_table "reagents", force: :cascade do |t|
    t.string "image"
    t.string "amplific"
    t.string "campo1"
    t.string "campo2"
    t.string "campo3"
    t.string "campo4"
    t.string "campo5"
    t.string "campo6"
    t.string "campo7"
    t.string "campo8"
    t.string "campo9"
    t.string "campo10"
    t.string "campo11"
    t.string "campo12"
    t.string "campo13"
    t.string "campo14"
    t.string "campo15"
    t.string "campo16"
    t.string "campo17"
    t.string "campo18"
    t.string "campo19"
    t.string "campo20"
    t.string "campo21"
    t.string "campo22"
    t.string "campo23"
    t.string "campo24"
    t.date "data1"
    t.date "data2"
    t.date "data3"
    t.date "data4"
    t.date "data5"
    t.date "data6"
    t.date "data7"
    t.date "data8"
    t.date "data9"
    t.date "data12"
    t.date "data13"
    t.date "data14"
    t.date "data15"
    t.date "data16"
    t.date "data17"
    t.date "data18"
    t.date "data19"
    t.date "data20"
    t.date "data23"
    t.date "data24"
    t.text "obs"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["board_id"], name: "index_reagents_on_board_id"
  end

  create_table "relats", force: :cascade do |t|
    t.string "who"
    t.date "when"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_relats_on_board_id"
    t.index ["phase_id"], name: "index_relats_on_phase_id"
  end

  create_table "reports", force: :cascade do |t|
    t.text "detail"
    t.bigint "board_id"
    t.bigint "phase_id"
    t.bigint "reagent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_reports_on_board_id"
    t.index ["phase_id"], name: "index_reports_on_phase_id"
    t.index ["reagent_id"], name: "index_reports_on_reagent_id"
  end

  create_table "signatures", force: :cascade do |t|
    t.string "uname"
    t.bigint "dnanum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "board_id"
    t.index ["board_id"], name: "index_signatures_on_board_id"
    t.index ["dnanum_id"], name: "index_signatures_on_dnanum_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.boolean "supervisor"
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "boardnums"
  add_foreign_key "dnanums", "boardnums"
  add_foreign_key "dnanums", "boards"
  add_foreign_key "dnanums", "exams"
  add_foreign_key "dnanums", "reagents"
  add_foreign_key "eletroforeses", "boards"
  add_foreign_key "eletroforeses", "phases"
  add_foreign_key "hibrids", "boards"
  add_foreign_key "hibrids", "phases"
  add_foreign_key "interprets", "boards"
  add_foreign_key "interprets", "phases"
  add_foreign_key "interps", "boards"
  add_foreign_key "interps", "phases"
  add_foreign_key "pcrs", "boards"
  add_foreign_key "pcrs", "phases"
  add_foreign_key "phases", "boards"
  add_foreign_key "reagents", "boards"
  add_foreign_key "relats", "boards"
  add_foreign_key "relats", "phases"
  add_foreign_key "reports", "boards"
  add_foreign_key "reports", "phases"
  add_foreign_key "reports", "reagents"
  add_foreign_key "signatures", "boards"
  add_foreign_key "signatures", "dnanums"
end
