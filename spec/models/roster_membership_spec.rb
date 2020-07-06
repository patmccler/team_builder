require "rails_helper"

RSpec.describe RosterMembership do

  describe "validations" do
    it "has a valid factory" do

      roster_membership = create :roster_membership
      expect(roster_membership.valid?).to be(true)
    end
  end

  describe "relates rosters and units" do
    it "joins a unit with a roster" do
      roster = create :roster
      unit = create :warcraft_unit

      create :roster_membership, roster: roster, unit: unit
      expect(roster.units).to include(unit)
    end
  end
end