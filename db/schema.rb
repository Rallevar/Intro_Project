# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2026_04_04_220840) do
  create_table "accounts", force: :cascade do |t|
    t.string "account_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "ward_id", null: false
    t.integer "vendor_id", null: false
    t.integer "account_id", null: false
    t.string "entry_date"
    t.text "description"
    t.string "account"
    t.decimal "amount"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_expenses_on_account_id"
    t.index ["vendor_id"], name: "index_expenses_on_vendor_id"
    t.index ["ward_id"], name: "index_expenses_on_ward_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "vendor_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wards", force: :cascade do |t|
    t.string "ward_name"
    t.string "council_member"
    t.integer "total_population"
    t.integer "median_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "accounts"
  add_foreign_key "expenses", "vendors"
  add_foreign_key "expenses", "wards"
end
