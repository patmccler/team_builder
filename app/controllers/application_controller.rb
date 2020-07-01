class ApplicationController < ActionController::Base

private

  def require_admin
    redirect_to root_path unless helpers.admin?
  end
end
