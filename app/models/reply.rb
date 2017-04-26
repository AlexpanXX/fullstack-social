class Reply < ApplicationRecord
  belongs_to :invitation

  validates :content, presence: true
end
