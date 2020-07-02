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

  describe "team membership autopopulation" do
    it "creates when team is created, based on team size" do
      team = create :team, team_size: 5
      expect(team.team_memberships.count).to eq(5)
    end

    it "adds more if team size is increased" do
      team = create :team, team_size: 5
      team.update(team_size: 7)

      expect(team.team_memberships.count).to eq(7)
    end

    it "removes some if team size is decreased" do
      team = create :team, team_size: 5
      team.update_attributes(team_size: 3)

      expect(team.team_memberships.count).to eq(3)
    end
  end
end
