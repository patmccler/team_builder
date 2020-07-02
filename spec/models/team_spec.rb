require "rails_helper"

RSpec.describe Team do
  describe "validations" do
    it "has a valid factory" do
      team = create :team

      expect(team.valid?).to be(true)
    end

    it "has a unique name per user" do
      user = build_stubbed :user
      name = "Dream Team"
      create :team, user: user, name: name

      expect((build :team, user: user, name: name).valid?).to be false
      expect((build :team, name: nil).valid?).to be false
    end

    it "has a team size between 1 and 40" do
      expect((build :team, team_size: 0).valid?).to be false
      expect((build :team, team_size: 41).valid?).to be false
      expect((build :team, team_size: nil).valid?).to be false
      expect((build :team, team_size: 1).valid?).to be true
      expect((build :team, team_size: 40).valid?).to be true
    end
  end

  describe "it updates its team_memberships when team size changes" do
    # TODO: after team memberships factory created
  end
end
