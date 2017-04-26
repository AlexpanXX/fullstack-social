class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: "User"
  belongs_to :invited, class_name: "User"
  has_one :reply

  validates :message, presence: true

  scope :recent, -> {order("created_at DESC")}
end
