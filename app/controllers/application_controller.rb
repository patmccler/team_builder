class ApplicationController < ActionController::Base
private

  def require_admin
    binding.pry
    redirect_to root_path unless helpers.admin?
  end
end
