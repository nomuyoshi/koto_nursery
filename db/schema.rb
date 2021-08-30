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

ActiveRecord::Schema.define(version: 2021_08_28_120439) do

  create_table "borderlines", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nursery_code", null: false
    t.integer "age", null: false
    t.boolean "priority_order", null: false
    t.integer "point"
    t.integer "year", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["nursery_code"], name: "fk_rails_874ec6e2c5"
  end

  create_table "capacities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "nursery_code", null: false
    t.integer "age", null: false
    t.integer "num", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["age", "nursery_code"], name: "index_capacities_on_age_and_nursery_code", unique: true
    t.index ["nursery_code"], name: "index_capacities_on_nursery_code"
  end

  create_table "nurseries", primary_key: "code", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.decimal "longitude", precision: 13, scale: 10
    t.decimal "latitude", precision: 13, scale: 10
    t.string "phone_number", null: false
    t.integer "kind", default: 0, null: false
    t.integer "min_age_type", null: false
    t.integer "opening_type", null: false
    t.integer "overtime_condition_type"
    t.text "url"
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["latitude", "longitude"], name: "index_nurseries_on_latitude_and_longitude"
  end

  add_foreign_key "borderlines", "nurseries", column: "nursery_code", primary_key: "code"
  add_foreign_key "capacities", "nurseries", column: "nursery_code", primary_key: "code"
end
