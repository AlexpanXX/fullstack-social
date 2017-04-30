module MembersHelper

  def render_invite(member)
    gender = render_call(member)
    "约　" + gender
  end

  def render_get_known(member)
    gender = render_call(member)
    "了解" + gender
  end
end
