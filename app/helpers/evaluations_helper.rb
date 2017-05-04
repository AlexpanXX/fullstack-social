module EvaluationsHelper

  def render_evaluation_type(type)
    if type.to_s == '1'
      return "赞赏"
    elsif type.to_s == '2'
      return "指正"
    end
    "评价"
  end

  def render_evaluation_type_icon(evaluation)
    if evaluation.type_id == 1
      fa_icon("heart lg")
    elsif evaluation.type_id == 2
      fa_icon("exclamation lg")
    end
  end
end
