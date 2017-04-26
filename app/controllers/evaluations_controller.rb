class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_member_by_id, only: [:index, :new, :create, :edit, :update]
  before_action :find_evaluation_by_id, only: [:edit, :update]

  def index
    @evaluations = @member.received_evaluations.recent.paginate(page: params[:page], per_page: 10)
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.inviter = current_user
    @evaluation.invited = @member
    if @evaluation.save
      redirect_to member_evaluations_path(@member)
      flash[:notice] =  "您对 #{render_name(@member)} 的评价已经成功发表!"
    else
      render :new
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to member_evaluations_path(@member)
      flash[:notice] =  "成功修改对 #{render_name(@member)} 的评价."
    else
      render :edit
    end
  end

  private

  def find_member_by_id
    @member = User.find(params[:member_id])
  end

  def find_evaluation_by_id
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:message)
  end
end
