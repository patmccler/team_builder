require "rails_helper"

RSpec.describe WarcraftUnit do

  describe "validations" do
    it "has a valid factory" do
      unit = create :warcraft_unit
      expect(unit.valid?).to be(true)
    end

    it "must have a unique name in its rosters" do
      expect(build(:roster, name: nil).valid?).to be(false)

      name = "Marksman Hunter"
      game = create :game
      roster = create :roster, game: game

      create :roster_membership, roster: roster, unit: (create :warcraft_unit, name: name, game: game)

      unit = build(:warcraft_unit, name: name, game: game)
      # using factory doesnt hit validation correctly
      unit.roster_memberships.build(roster: roster)
      expect(unit.valid?).to be(false)
    end

  end

end