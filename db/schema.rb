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

ActiveRecord::Schema.define(version: 20161101061227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.boolean  "private"
    t.string   "bedding"
    t.boolean  "inactive"
    t.integer  "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accommodations", ["host_id"], name: "index_accommodations_on_host_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address_1"
    t.string   "street_address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "neighborhood"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "clinic_id"
    t.datetime "appt_time"
    t.integer  "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "appointments", ["clinic_id"], name: "index_appointments_on_clinic_id", using: :btree
  add_index "appointments", ["guest_id"], name: "index_appointments_on_guest_id", using: :btree

  create_table "clinics", force: :cascade do |t|
    t.string   "title"
    t.string   "nearest_transit"
    t.string   "procedure_types"
    t.string   "site_url"
    t.string   "map_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "companions", force: :cascade do |t|
    t.integer  "guest_id"
    t.string   "age"
    t.string   "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companions", ["guest_id"], name: "index_companions_on_guest_id", using: :btree

  create_table "emails", force: :cascade do |t|
    t.integer  "emailable_id"
    t.string   "emailable_type"
    t.string   "address"
    t.boolean  "inactive"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "emails", ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.text     "notes"
    t.integer  "person_id"
    t.boolean  "allergies"
    t.boolean  "male_okay"
    t.boolean  "pets_okay"
    t.integer  "support_request_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "guests", ["person_id"], name: "index_guests_on_person_id", using: :btree
  add_index "guests", ["support_request_id"], name: "index_guests_on_support_request_id", using: :btree

  create_table "hosts", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "guest_capacity"
    t.boolean  "inactive"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hosts", ["volunteer_id"], name: "index_hosts_on_volunteer_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "people", ["user_id"], name: "index_people_on_user_id", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "type"
    t.string   "size"
    t.string   "behavior"
    t.integer  "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pets", ["host_id"], name: "index_pets_on_host_id", using: :btree

  create_table "phone_numbers", force: :cascade do |t|
    t.integer  "callable_id"
    t.string   "callable_type"
    t.string   "number"
    t.boolean  "inactive"
    t.string   "type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "phone_numbers", ["callable_type", "callable_id"], name: "index_phone_numbers_on_callable_type_and_callable_id", using: :btree

  create_table "reimbursement_requests", force: :cascade do |t|
    t.integer  "support_request_id"
    t.integer  "assigned_to"
    t.integer  "requested_by"
    t.string   "status"
    t.string   "receipt_upload"
    t.integer  "amount_cents"
    t.string   "reason"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services_rendereds", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "support_request_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "services_rendereds", ["service_id"], name: "index_services_rendereds_on_service_id", using: :btree
  add_index "services_rendereds", ["support_request_id"], name: "index_services_rendereds_on_support_request_id", using: :btree

  create_table "support_requests", force: :cascade do |t|
    t.boolean  "completed"
    t.text     "notes"
    t.date     "date_of_contact"
    t.date     "date_of_assistance"
    t.integer  "guest_id"
    t.string   "referred_from"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "support_requests", ["guest_id"], name: "index_support_requests_on_guest_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "role"
    t.string   "do_not_contact"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "access_token"
    t.string   "refresh_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteer_assignments", force: :cascade do |t|
    t.integer  "support_request_id"
    t.integer  "volunteer_id"
    t.string   "status"
    t.text     "notes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "volunteer_assignments", ["support_request_id"], name: "index_volunteer_assignments_on_support_request_id", using: :btree
  add_index "volunteer_assignments", ["volunteer_id"], name: "index_volunteer_assignments_on_volunteer_id", using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.date     "training_date"
    t.boolean  "can_drive"
    t.date     "docs_received_date"
    t.text     "notes"
    t.boolean  "active"
    t.string   "position"
    t.integer  "person_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "volunteers", ["person_id"], name: "index_volunteers_on_person_id", using: :btree

end
