# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string
#  nickname               :string
#  gender                 :string
#  wechat                 :string
#  github                 :string
#  logdown                :string
#  role                   :string
#  is_admin               :boolean          default("f")
#

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
