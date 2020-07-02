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
      expect(build(:game, name: nil).valid?).to be(false)
    end

  end

end