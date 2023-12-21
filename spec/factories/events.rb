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
FactoryBot.define do
  factory :event do
    name { 'MyString' }
    color { 'MyString' }
    duration { 1 }
    customer_paid { false }
    payment_required { false }
    association :user, factory: :user
  end
end
