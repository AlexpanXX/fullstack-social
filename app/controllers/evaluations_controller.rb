class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_member_by_id, only: [:index, :new, :create, :edit, :update]
  before_action :find_evaluation_by_id, only: [:edit, :update]
  before_action :check_not_self, only: [:new, :create]
  before_action :check_is_self, only: [:edit, :update]
  before_action :get_evaluation_type, only: [:index, :new, :create]

  def index
    if @type.nil?
      @evaluations = @member.received_evaluations.recent
    else
      @evaluations = @member.received_evaluations.recent.where("type_id = ?", @type)
    end
    @evaluations = @evaluations.paginate(page: params[:page], per_page: 5)
  end

  def new
    @evaluation = Evaluation.new
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.valuer = current_user
    @evaluation.receiver = @member
    if @evaluation.save
      redirect_to member_evaluations_path(@member)
      flash[:notice] =  "您对 #{get_name(@member)} 的评价已经成功发表!"
    else
      render :new
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to member_evaluations_path(@member)
      flash[:notice] =  "成功修改对 #{get_name(@member)} 的评价."
    else
      render :edit
    end
  end

  private

  def check_is_self
    unless @evaluation.valuer == current_user
      flash[:alert] = "您没有权限编辑这条评价"
      redirect_to :back
    end
  end

  def check_not_self
    if @member == current_user
      flash[:alert] = "不能对自己进行评价"
      redirect_to :back
    end
  end

  def find_member_by_id
    @member = User.find(params[:member_id])
  end

  def get_evaluation_type
    @type = params[:type]
  end

  def find_evaluation_by_id
    @evaluation = Evaluation.find(params[:id])
  end

  def evaluation_params
    params.require(:evaluation).permit(:message, :type_id)
  end
end
