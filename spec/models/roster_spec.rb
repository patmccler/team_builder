require "rails_helper"

RSpec.describe Roster do

  describe "roster validations" do
    it "has a valid factory" do
      roster = create :roster
      expect(roster.valid?).to be(true)
    end
  end

end
