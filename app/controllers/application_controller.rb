class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def get_name(member)
    if member.nickname.present?
      member.nickname
    else
      member.email
    end
  end
end
