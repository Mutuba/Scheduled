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
class Event < ApplicationRecord
  belongs_to :user

  has_rich_text :description

  def description
    rich_text_description || build_rich_text_body(description: read_attribute(:description))
  end
end
