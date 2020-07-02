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
      game = create :game, name: "TFT"
      roster = create :roster, game: game

      create :roster_membership, roster: roster, unit: (create :team_fight_tactics_unit, name: name, game: game)

      unit = build(:team_fight_tactics_unit, name: name, game: game)
      # using factory doesnt hit validation correctly
      unit.roster_memberships.build(roster: roster)
      expect(unit.valid?).to be(false)
    end

  end

end