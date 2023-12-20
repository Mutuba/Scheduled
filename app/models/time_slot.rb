# == Schema Information
#
# Table name: time_slots
#
#  id         :bigint           not null, primary key
#  end_at     :datetime
#  start_at   :datetime
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
end