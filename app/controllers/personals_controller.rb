class PersonalsController < ApplicationController
  before_action :authenticate_user!

  def update
    if current_user.update(personal_params)
      redirect_to personal_profile_path, notice: "个人资料已成功修改！"
    else
      render :edit
    end
  end

  private

  def personal_params
    params.require(:user).permit(:avatar, :nickname, :gender, :wechat, :github, :logdown, :role)
  end
end
