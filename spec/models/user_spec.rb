require "rails_helper"

RSpec.describe User do
  it "has a valid factory" do
    expect(build(:user).valid?).to be(true)
  end

  it "must have unique username" do
    create :user, username: "TEST"

    expect(build(:user, username: "TEST").valid?).to be(false)
  end

end