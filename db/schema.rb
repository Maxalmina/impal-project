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

ActiveRecord::Schema.define(version: 2018_11_28_001251) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "image"
    t.bigint "produsen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produsen_id"], name: "index_furnitures_on_produsen_id"
  end

  create_table "produsens", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_details", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "furniture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "transaksi_id"
    t.index ["furniture_id"], name: "index_transaction_details_on_furniture_id"
    t.index ["transaksi_id"], name: "index_transaction_details_on_transaksi_id"
  end

  create_table "transaksis", force: :cascade do |t|
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "produsen_id"
    t.bigint "user_id"
    t.index ["produsen_id"], name: "index_transaksis_on_produsen_id"
    t.index ["user_id"], name: "index_transaksis_on_user_id"
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
  end

  add_foreign_key "furnitures", "produsens"
  add_foreign_key "transaction_details", "furnitures"
  add_foreign_key "transaction_details", "transaksis"
  add_foreign_key "transaksis", "produsens"
end
