# frozen_string_literal: true

# == Schema Information
#
# Table name: time_slots
#
#  id         :bigint           not null, primary key
#  end_at     :datetime         not null
#  start_at   :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#
# Indexes
#
#  index_time_slots_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class TimeSlot < ApplicationRecord
  belongs_to :event
  validates :event, presence: true
  validates :start_at, :end_at, presence: true
end
