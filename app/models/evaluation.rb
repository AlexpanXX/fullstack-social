# == Schema Information
#
# Table name: evaluations
#
#  id          :integer          not null, primary key
#  valuer_id   :integer
#  receiver_id :integer
#  message     :text
#  type        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Evaluation < ApplicationRecord
  belongs_to :valuer, class_name: "User"
  belongs_to :receiver, class_name: "User"
  
  validates :message, presence: true

  scope :recent, -> {order("created_at DESC")}
end
