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

ActiveRecord::Schema.define(version: 2018_09_27_035224) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "produsen_id"
    t.index ["produsen_id"], name: "index_furnitures_on_produsen_id"
  end

  create_table "report_details", force: :cascade do |t|
    t.string "description"
    t.bigint "transaction_id"
    t.bigint "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_report_details_on_report_id"
    t.index ["transaction_id"], name: "index_report_details_on_transaction_id"
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_reports_on_admin_id"
  end

  create_table "transaction_details", force: :cascade do |t|
    t.bigint "furniture_id"
    t.integer "quantity"
    t.decimal "totalPrice"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["furniture_id"], name: "index_transaction_details_on_furniture_id"
    t.index ["transaction_id"], name: "index_transaction_details_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "totalPayment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.integer "status", default: 0
    t.index ["customer_id"], name: "index_transactions_on_customer_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alamat"
    t.string "telp"
    t.integer "role", default: 0
  end

  add_foreign_key "furnitures", "users", column: "produsen_id"
  add_foreign_key "report_details", "reports"
  add_foreign_key "report_details", "transactions"
  add_foreign_key "reports", "users", column: "admin_id"
  add_foreign_key "transaction_details", "furnitures"
  add_foreign_key "transaction_details", "transactions"
  add_foreign_key "transactions", "users", column: "customer_id"
end
