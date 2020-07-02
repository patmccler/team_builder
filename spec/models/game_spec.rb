require "rails_helper"

RSpec.describe Game do
  describe "game validations" do
    it "has a valid factory" do
      game = create :game

      expect(game.valid?).to be(true)
    end

    it "has a unique name" do
      name = "WOW"
      create :game, name: name

      expect(build(:game, name: name).valid?).to be(false)
    end

    it "must have a name" do
      game = build(:game, name: nil)
      expect(game.valid?).to be(false)
    end

    it "must have specific unit types" do
      game = build(:game, unit_type: "Baseball Player")
      expect(game.valid?).to be(false)
      expect(build(:game, unit_type: nil).valid?).to be(false)

      Game::UNIT_TYPES.each do |unit_type|
        game = build(:game, unit_type: unit_type)
        expect(game.valid?).to be(true)
      end
    end
  end
end
