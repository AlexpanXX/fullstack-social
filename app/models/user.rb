class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :sent_invitations, class_name: "Invitation", foreign_key: :inviter_id
  has_many :received_invitations, class_name: "Invitation", foreign_key: :invited_id
  has_many :sent_evaluations, class_name: "Evaluation", foreign_key: :valuer_id
  has_many :received_evaluations, class_name: "Evaluation", foreign_key: :receiver_id

  def admin?
    self.is_admin
  end
end
