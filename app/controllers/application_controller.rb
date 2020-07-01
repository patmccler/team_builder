class ApplicationController < ActionController::Base


private

  def require_admin
    unless helpers.admin?
      redirect_to root_path
    end
  end
end
