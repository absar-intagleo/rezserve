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

ActiveRecord::Schema.define(version: 2018_07_23_120114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_beds", force: :cascade do |t|
    t.integer "bed_quantity"
    t.float "bed_charges"
    t.string "bed_charges_unit"
    t.bigint "block_id"
    t.bigint "bed_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bed_type_id"], name: "index_additional_beds_on_bed_type_id"
    t.index ["block_id"], name: "index_additional_beds_on_block_id"
  end

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenity_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.bigint "block_id"
    t.text "availability_matrix"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_availabilities_on_block_id"
  end

  create_table "bed_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string "name"
    t.bigint "block_type_id"
    t.bigint "residential_property_id"
    t.float "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_type_id"], name: "index_blocks_on_block_type_id"
    t.index ["residential_property_id"], name: "index_blocks_on_residential_property_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.float "chargeable_rate"
    t.string "currency_code"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "country_code"
    t.string "postal_code"
    t.string "locale"
    t.string "itinerary_id"
    t.string "confirmation_number"
    t.float "surcharge_total"
    t.string "cancellation_number"
    t.datetime "cancellation_time"
    t.string "status"
    t.datetime "arrival_date"
    t.datetime "departure_date"
    t.string "wallet_name"
    t.bigint "block_id"
    t.string "dt_uuid"
    t.string "loyalty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_bookings_on_block_id"
  end

  create_table "cancellation_policies", force: :cascade do |t|
    t.string "plan"
    t.string "penalty"
    t.boolean "refundable"
    t.bigint "block_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_cancellation_policies_on_block_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "currency_code"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotel_chains", force: :cascade do |t|
    t.string "name"
    t.integer "chain_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "imageables", force: :cascade do |t|
    t.string "block_type"
    t.bigint "block_id"
    t.string "property_type"
    t.bigint "property_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_type", "block_id"], name: "index_imageables_on_block_type_and_block_id"
    t.index ["category_id"], name: "index_imageables_on_category_id"
    t.index ["property_type", "property_id"], name: "index_imageables_on_property_type_and_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.bigint "property_type_id"
    t.text "address"
    t.string "zip_code"
    t.string "city"
    t.string "state"
    t.string "contract_signer"
    t.string "designation"
    t.text "special_instructions"
    t.string "booking_cancellation_period"
    t.text "booking_cancellation_policy"
    t.bigint "user_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_properties_on_country_id"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "property_amenities", force: :cascade do |t|
    t.bigint "amenity_id"
    t.bigint "amenity_type_id"
    t.integer "reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenity_id"], name: "index_property_amenities_on_amenity_id"
    t.index ["amenity_type_id"], name: "index_property_amenities_on_amenity_type_id"
  end

  create_table "property_settings", force: :cascade do |t|
    t.integer "minimum_age_limit"
    t.string "check_in_time"
    t.string "check_out_time"
    t.string "age_category"
    t.integer "adult_age_limit"
    t.integer "infant_age_limit"
    t.string "smoking_policy"
    t.bigint "residential_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["residential_property_id"], name: "index_property_settings_on_residential_property_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rating_sources", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residential_properties", force: :cascade do |t|
    t.string "website"
    t.bigint "property_id"
    t.bigint "hotel_chain_id"
    t.bigint "star_rating_id"
    t.bigint "rating_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_chain_id"], name: "index_residential_properties_on_hotel_chain_id"
    t.index ["property_id"], name: "index_residential_properties_on_property_id"
    t.index ["rating_source_id"], name: "index_residential_properties_on_rating_source_id"
    t.index ["star_rating_id"], name: "index_residential_properties_on_star_rating_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.string "bed_detail"
    t.string "number_of_person"
    t.boolean "smoking_allowed"
    t.float "room_size_value"
    t.string "room_size_unit"
    t.boolean "adults_only"
    t.boolean "wheel_chair_accessible"
    t.string "bed_type"
    t.integer "bed_count"
    t.bigint "block_id"
    t.bigint "room_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_rooms_on_block_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "service_fees", force: :cascade do |t|
    t.string "name"
    t.integer "type"
    t.float "fee"
    t.string "duration_unit"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_service_fees_on_property_id"
  end

  create_table "star_ratings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.float "fee_percentage"
    t.string "fee_duration_unit"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_taxes_on_property_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "dt_uuid"
    t.string "email"
    t.integer "account_status"
    t.bigint "user_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type_id"], name: "index_users_on_user_type_id"
  end

  add_foreign_key "additional_beds", "bed_types"
  add_foreign_key "additional_beds", "blocks"
  add_foreign_key "availabilities", "blocks"
  add_foreign_key "blocks", "block_types"
  add_foreign_key "blocks", "residential_properties"
  add_foreign_key "bookings", "blocks"
  add_foreign_key "cancellation_policies", "blocks"
  add_foreign_key "imageables", "categories"
  add_foreign_key "properties", "countries"
  add_foreign_key "properties", "property_types"
  add_foreign_key "properties", "users"
  add_foreign_key "property_amenities", "amenities"
  add_foreign_key "property_amenities", "amenity_types"
  add_foreign_key "property_settings", "residential_properties"
  add_foreign_key "residential_properties", "hotel_chains"
  add_foreign_key "residential_properties", "properties"
  add_foreign_key "residential_properties", "rating_sources"
  add_foreign_key "residential_properties", "star_ratings"
  add_foreign_key "rooms", "blocks"
  add_foreign_key "rooms", "room_types"
  add_foreign_key "service_fees", "properties"
  add_foreign_key "taxes", "properties"
  add_foreign_key "users", "user_types"
end
