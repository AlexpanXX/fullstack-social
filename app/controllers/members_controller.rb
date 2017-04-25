class MembersController < ApplicationController
  before_action :validate_search_key, only: [:search]

  def index
    @result = User.ransack(@query_string).result(distinct: true)
    @members = @result.paginate(page: params[:page], per_page: 20)
  end

  private

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end
end
