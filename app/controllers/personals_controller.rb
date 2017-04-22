class PersonalsController < ApplicationController
  before_action :authenticate_user!

  # 显示个人信息，收到的评价，收到的”约“
  def index
    @invitations = Invitation.where(receiver_id: current_user.id).recent.limit(10) # 最近收到的10个”约“
    @evaluations = Evaluation.where(receiver_id: current_user.id).recent.limit(20) # 最近收到的20条评价
  end
end
