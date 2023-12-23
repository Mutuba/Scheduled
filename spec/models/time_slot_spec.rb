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
require 'rails_helper'

RSpec.describe TimeSlot, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :end_at }
    it { should validate_presence_of :start_at }
    it { should validate_presence_of :event }

    context 'when required fields are present' do
      it 'is valid with valid attributes' do
        time_slot = create(:time_slot)

        expect(time_slot).to be_valid
        expect do
          create(:time_slot)
        end.to change { TimeSlot.count }.by(1)
      end
    end
  end

  describe 'Associations' do
    it { should belong_to :event }
  end
end
