class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_invites, class_name: "Invitation", foreign_key: :inviter_id
  has_many :received_invites, through: :sent_invites, source: :invited
  has_many :sent_evaluates, class_name: "Evaluation", foreign_key: :valuer_id
  has_many :received_evaluates, through: :sent_evaluates, source: :receiver

  def admin?
    self.is_admin
  end
end
