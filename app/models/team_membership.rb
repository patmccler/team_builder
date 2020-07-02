class TeamMembership < ApplicationRecord
  belongs_to :team
  belongs_to :unit, polymorphic: true, optional: true

  before_save :unit_changed, if: :unit_id_changed?

private

  def unit_changed
    RosterMembership.find_by(roster: team.roster, unit: unit).increment_appearances
    self.change_count += 1
  end
end
