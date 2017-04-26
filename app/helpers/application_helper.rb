module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def render_name(member)
    if member.nickname.present?
      member.nickname
    else
      member.email
    end
  end

  def render_avatar(user, classname)
    if user.avatar.file.nil?
      image_tag("http://ww2.sinaimg.cn/large/006tKfTcgy1feyxrgn3snj303c03c3yc.jpg", class: classname)
    else
      image_tag(user.avatar.url, class: classname)
    end
  end

end
