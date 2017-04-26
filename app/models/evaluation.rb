class Evaluation < ApplicationRecord
  belongs_to :valuer, class_name: "User"
  belongs_to :receiver, class_name: "User"
  
  validates :message, presence: true

  scope :recent, -> {order("created_at DESC")}
end
