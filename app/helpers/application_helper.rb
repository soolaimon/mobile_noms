module ApplicationHelper
  def set_title(title)
    if title
      "#{title} | Mobilenoms"
    else
      "Mobilenoms"
    end
  end
end
