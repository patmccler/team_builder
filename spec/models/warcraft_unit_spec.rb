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
      roster = create :roster
      # TODO: FINISH THIS

      expect(build(:warcraft_unit, name: name).valid?).to be(false)
    end

  end

end