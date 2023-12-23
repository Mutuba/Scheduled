# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id               :bigint           not null, primary key
#  color            :string
#  customer_paid    :boolean
#  description      :string
#  duration         :integer
#  name             :string
#  payment_required :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :name }

    context 'when required fields are present' do
      it 'is valid' do
        event = create(:event)

        expect(event).to be_valid
        expect do
          create(:event)
        end.to change { Event.count }.by(1)
        expect(event.errors).to be_empty
      end
    end

    context 'when required fields are not present' do
      it 'raises errors' do
        event = Event.create(name: nil, description: nil)
        expect(event).not_to be_valid

        expect(event.errors.messages[:name]).to include("can't be blank")
        expect(event.errors.messages[:description]).to include("can't be blank")
      end
    end
  end

  describe 'Associations' do
    it { should belong_to :user }
  end
end
