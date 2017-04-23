class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_invites, class_name: "Invitation", foreign_key: :inviter_id
  has_many :received_invites, class_name: "Invitation", foreign_key: :invited_id
  has_many :sent_evaluates, class_name: "Evaluation", foreign_key: :valuer_id
  has_many :received_evaluates, class_name: "Evaluation", foreign_key: :receiver_id

end
