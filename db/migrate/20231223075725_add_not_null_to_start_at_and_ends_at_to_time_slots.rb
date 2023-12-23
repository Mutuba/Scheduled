# frozen_string_literal: true

class AddNotNullToStartAtAndEndsAtToTimeSlots < ActiveRecord::Migration[7.0]
  def change
    change_column_null :time_slots, :start_at, false
    change_column_null :time_slots, :end_at, false
  end
end
