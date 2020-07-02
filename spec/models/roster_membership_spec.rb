require "rails_helper"

RSpec.describe RosterMembership do

  describe "validations" do
    it "has a valid factory" do

      roster_membership = create :roster_membership
      expect(roster_membership.valid?).to be(true)
      binding.pry
    end

  end
end