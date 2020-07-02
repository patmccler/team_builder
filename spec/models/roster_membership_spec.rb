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
      g = create :game
      roster = create :roster, game: g
      unit = create :warcraft_unit, game: g

      create :roster_membership, roster: roster, unit: unit
      expect(roster.units).to include(unit)
    end

    it "ensures unit and roster are from the same game" do
      # will generate their own, unique games
      roster = create :roster
      unit = create :warcraft_unit

      rm = build :roster_membership, roster: roster, unit: unit
      expect(rm.valid?).to be false
    end
  end
end