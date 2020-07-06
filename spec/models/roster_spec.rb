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

    it "must have a unit type from list" do
      roster = build_stubbed :roster, unit_type: "NOT REAL"

      expect(roster.valid?).to be false
      valid_roster = build :roster, unit_type: Roster::UNIT_TYPES[1]
      expect(valid_roster.valid?).to be true
    end
  end

end
