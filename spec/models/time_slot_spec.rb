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
      it 'is valid' do
        time_slot = create(:time_slot)

        expect(time_slot).to be_valid
        expect do
          create(:time_slot)
        end.to change { TimeSlot.count }.by(1)
        expect(time_slot.errors).to be_empty
      end
    end

    context 'when required fields are not present' do
      it 'raises errors' do
        event = create(:event)
        time_slot = TimeSlot.create(start_at: nil, end_at: nil, event: event)
        expect(time_slot).not_to be_valid
        
        expect(time_slot.errors.messages[:start_at]).to include("can't be blank")
        expect(time_slot.errors.messages[:end_at]).to include("can't be blank")
      end
    end
  end

  describe 'Associations' do
    it { should belong_to :event }
  end
end
