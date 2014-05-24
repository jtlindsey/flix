module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  def page_title
    if content_for?(:title)
      "Flix - #{content_for(:title)}"
    else
      "Flix"
    end
  end
end
