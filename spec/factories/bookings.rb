# frozen_string_literal: true

# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  customer_paid :boolean
#  email         :string
#  ends_at       :datetime
#  first_name    :string
#  last_name     :string
#  starts_at     :datetime
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_id      :bigint           not null
#  time_slot_id  :bigint           not null
#
# Indexes
#
#  index_bookings_on_event_id      (event_id)
#  index_bookings_on_time_slot_id  (time_slot_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (time_slot_id => time_slots.id)
#
FactoryBot.define do
  factory :booking do
    status { 1 }
    first_name { 'MyString' }
    last_name { 'MyString' }
    email { 'MyString' }
    starts_at { '2023-12-20 16:13:49' }
    ends_at { '2023-12-20 16:13:49' }
    customer_paid { false }
    time_slot { nil }
    event { nil }
  end
end
