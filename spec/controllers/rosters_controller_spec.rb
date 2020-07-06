require "rails_helper"

RSpec.describe RosterController do
  describe "GET index" do
    it "redirects if not logged in" do

      get :index
      expect(response).to redirect_to(root_path)
    end

    it "redirects if not admin" do
      user = create :user
      session[:id] = user.id

      get :index
      expect(response).to redirect_to(root_path)
    end

    it "renders if admin" do
      user = create :user, admin: true
      session[:user_id] = user.id

      get :index
      expect(response).to render_template(:index)
    end
  end
end