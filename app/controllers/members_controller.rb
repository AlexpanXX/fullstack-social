class MembersController < ApplicationController
  before_action :validate_search_key, only: [:index]

  def index
    @result = User.ransack(
    email_cont: @query_string,
    nickname_cont: @query_string,
    gender_cont: @query_string,
    wechat_cont: @query_string,
    github_cont: @query_string,
    logdown_cont: @query_string,
    role_cont: @query_string,
    m: 'or'
    ).result(distinct: true)
    @members = @result.paginate(page: params[:page], per_page: 20)
  end

  private

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end
end
