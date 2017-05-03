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
    if member == current_user
      '我'
    elsif member.nickname.present?
      member.nickname
    else
      member.email
    end
  end

  def render_email(member)
    if member.nickname.nil?
      ''
    else
      ('<i class="fa fa-envelope-o" aria-hidden="true"></i> ' + member.email).html_safe
    end
  end

  def render_avatar(user, classname)
    if user.avatar.file.nil?
      image_tag("http://ww2.sinaimg.cn/large/006tKfTcgy1feyxrgn3snj303c03c3yc.jpg", class: classname)
    else
      image_tag(user.avatar.url, class: classname)
    end
  end

  def render_call(member)
    member == current_user ? "我" :
    member.gender == "男" ? "他" : "她"
  end

  def count_to_s(count)
    if count > 9999
      return "10k+"
    elsif count > 999
      return "1k+"
    elsif count > 99
      return "99+"
    else
      return count.to_s
    end
  end

  def render_invitations(member)
    gender = render_call(member)
    gender + "的邀请"
  end

  def render_evaluations(member)
    gender = render_call(member)
    gender + "的评价"
  end

  def render_create_time(o)
    render_date_time(o.created_at.localtime)
  end

  def render_update_time(o)
    render_date_time(o.updated_at.localtime)
  end

  def render_date_time(time)
    time.strftime('%H:%M:%S %Y-%m-%d')
  end
end
