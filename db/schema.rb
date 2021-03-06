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

ActiveRecord::Schema.define(version: 20180122124444) do

  create_table "day_rates", force: :cascade do |t|
    t.integer "pair_id"
    t.decimal "low"
    t.decimal "high"
    t.datetime "timestamp"
    t.index ["pair_id"], name: "index_day_rates_on_pair_id"
  end

  create_table "pairs", force: :cascade do |t|
    t.string "name"
    t.string "base_currency"
    t.string "quote_currency"
    t.decimal "quantity_increment"
    t.decimal "tick_size"
    t.decimal "take_liquidity_rate"
    t.decimal "provide_liquidity_rate"
    t.string "fee_currency"
    t.index ["name"], name: "index_pairs_on_name", unique: true
  end

  create_table "ticks", force: :cascade do |t|
    t.integer "pair_id"
    t.decimal "ask"
    t.decimal "bid"
    t.decimal "last"
    t.decimal "open"
    t.decimal "low"
    t.decimal "high"
    t.decimal "volume"
    t.decimal "volume_quote"
    t.datetime "timestamp"
    t.string "symbol"
    t.index ["pair_id"], name: "index_ticks_on_pair_id"
  end

end
