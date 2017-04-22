class Evaluation < ApplicationRecord
  belongs_to :valuer, class_name: "User"
  belongs_to :receiver, class_name: "User"
end
