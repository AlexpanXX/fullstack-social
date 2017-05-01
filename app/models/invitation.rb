# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  inviter_id :integer
#  invited_id :integer
#  message    :text
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: "User"
  belongs_to :invited, class_name: "User", counter_cache: :invitations_count, dependent: :destroy
  has_one :reply

  validates :message, presence: true

  scope :recent, -> {order("created_at DESC")}
end
