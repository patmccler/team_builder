require "rails_helper"

RSpec.describe Roster do

  describe "validations" do
    it "has a valid factory" do
      roster = create :roster
      expect(roster.valid?).to be(true)
    end

    it "must have a unique name" do
      name = "Some Group of Units"
      create :roster, name: name

      expect(build(:roster, name: name).valid?).to be(false)
      expect(build(:roster, name: nil).valid?).to be(false)
    end

    it "must have a description, under 140 chars" do
      long_desc = "A" * 141

      expect(build(:roster, description: nil).valid?).to be false
      expect(build(:roster, description: long_desc).valid?).to be false
    end
  end

  describe "relates to game" do
    it "Destroys with associated game" do
      game = create :game
      roster = create :roster, game: game

      expect(Roster.count).to be(1)
      game.destroy
      expect(Roster.count).to be(0)
    end

    it "gets its unit type from game" do
      game = build_stubbed :game
      roster = build_stubbed :roster, game: game

      expect(roster.unit_type).to be == game.unit_type
    end
  end

end
