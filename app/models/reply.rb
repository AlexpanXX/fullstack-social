# == Schema Information
#
# Table name: replies
#
#  id            :integer          not null, primary key
#  invitation_id :integer
#  content       :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Reply < ApplicationRecord
  belongs_to :invitation

  validates :content, presence: true
end
