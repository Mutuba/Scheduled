# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_231_220_140_315) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.integer 'status'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'email'
    t.datetime 'starts_at'
    t.datetime 'ends_at'
    t.boolean 'customer_paid'
    t.bigint 'time_slot_id', null: false
    t.bigint 'event_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_bookings_on_event_id'
    t.index ['time_slot_id'], name: 'index_bookings_on_time_slot_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.string 'color'
    t.integer 'duration'
    t.boolean 'customer_paid'
    t.boolean 'payment_required'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'description'
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'time_slots', force: :cascade do |t|
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.bigint 'event_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_time_slots_on_event_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.time 'office_hours_start'
    t.time 'office_hours_end'
    t.string 'fullname'
    t.string 'timezone'
    t.string 'avatar_url'
    t.string 'uid'
    t.string 'provider'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'bookings', 'events'
  add_foreign_key 'bookings', 'time_slots'
  add_foreign_key 'events', 'users'
  add_foreign_key 'time_slots', 'events'
end
