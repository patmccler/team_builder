require "rails_helper"

RSpec.describe User do

  describe "user validations" do
    it "has a valid factory" do
      expect(build(:user).valid?).to be(true)
    end

    it "must have unique username" do
      create :user, username: "TEST"

      expect(build(:user, username: "TEST").valid?).to be(false)
    end

    it "must have a username" do
      user = build :user, username: nil

      expect(user.valid?).to be(false)
    end
  end

  describe "user authentication" do
    it "can only be authenticated with its password" do
      password = "test_password"
      user = create :user, password: password


      expect(user.authenticate(password)).to be(user)
      expect(user.authenticate("NOT PASSWORD")).to be(false)
    end
  end
end