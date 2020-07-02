require "rails_helper"

RSpec.describe TeamMembership do
  describe "validations" do
    it "has a valid factory" do
      team_membership = create :team_membership

      expect(team_membership.valid?).to be(true)
    end

    it "does not require a unit" do
      tm = create :team_membership, unit: nil
      expect(tm.valid?).to be true
    end

    it "can have a unit" do
      rm = create :roster_membership
      tm = create :team_membership
      tm.unit = rm.unit
      expect(tm.valid?).to be true
    end

    it "sets unit type correctly" do
      tm = create :team_membership
      tm.unit = create :warcraft_unit
      expect(tm.unit_type).to eq("WarcraftUnit")
    end
  end

  describe "relates teams and units" do
    it "joins a unit with a team" do
      rm = create :roster_membership
      team = create :team, roster: rm.roster
      unit = rm.unit

      create :team_membership, team: team, unit: unit
      expect(team.units).to include(unit)
    end
  end
end