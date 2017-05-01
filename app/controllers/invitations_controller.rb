class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_member_by_id, only: [:index, :new, :create, :edit, :update]
  before_action :find_invitation_by_id, only: [:edit, :update]
  before_action :check_not_self, only: [:new, :create]
  before_action :check_is_self, only: [:edit, :update]

  def index
    @invitations = @member.received_invitations.recent.paginate(page: params[:page], per_page: 10)
  end

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.inviter = current_user
    @invitation.invited = @member
    if @invitation.save
      redirect_to member_invitations_path(@member)
      flash[:notice] =  "您的邀请已成功发送给 #{get_name(@member)}."
    else
      render :new
    end
  end

  def update
    if @invitation.update(invitation_params)
      redirect_to member_invitations_path(@member)
      flash[:notice] =  "您发送给 #{get_name(@member)} 的邀请修改成功!"
    else
      render :edit
    end
  end

  private

  def check_is_self
    unless @invitation.inviter == current_user
      flash[:alert] = "您没有权限编辑这条邀请信息"
      redirect_to :back
    end
  end

  def check_not_self
    if @member == current_user
      flash[:alert] = "不能给自己发送邀请"
      redirect_to :back
    end
  end

  def find_member_by_id
    @member = User.find(params[:member_id])
  end

  def find_invitation_by_id
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:message)
  end
end
