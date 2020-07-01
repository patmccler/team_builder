class StaticController < ApplicationController
  def welcome; end

  def signin
    @user = User.new
  end
end
