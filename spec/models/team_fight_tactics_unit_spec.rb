require "rails_helper"

RSpec.describe TeamFightTacticsUnit do

  describe "validations" do
    it "has a valid factory" do
      unit = create :team_fight_tactics_unit
      expect(unit.valid?).to be(true)
    end

    it "must have a unique name in its rosters" do
      expect(build(:roster, name: nil).valid?).to be(false)

      name = "Master Yi"
      roster = create :roster, unit_type: Roster::UNIT_TYPES[1]

      create :roster_membership, roster: roster, unit: (create :team_fight_tactics_unit, name: name)

      unit = build(:team_fight_tactics_unit, name: name)
      # using factory doesnt hit validation correctly
      unit.roster_memberships.build(roster: roster)
      expect(unit.valid?).to be false
    end

    it "cant have long combat style or affiliations" do
      unit = build :team_fight_tactics_unit, affiliation: ("a"*50)
      expect(unit.valid?).to be false
      unit = build :team_fight_tactics_unit, combat_style: ("a"*50)
      expect(unit.valid?).to be false
    end

  end

end