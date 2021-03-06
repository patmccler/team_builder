module SessionsHelper
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def admin?
    logged_in? && current_user.admin
  end
end
