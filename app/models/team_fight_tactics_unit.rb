class TeamFightTacticsUnit < ApplicationRecord
  belongs_to :game

  has_many :team_memberships, as: :unit
  has_many :teams, through: :team_memberships

  has_many :roster_memberships, as: :unit
  has_many :rosters, through: :roster_memberships

  validates :name, presence: true
  # Can I do this with scope directly
  validate :name_unique_in_rosters, if: :name_changed?

  scope :all_units_sharing_any_roster, ->(unit) {
    joins(:roster_memberships).where(roster_memberships: { roster: unit.roster_memberships.map(&:roster_id) })
  }

  def name_unique_in_rosters
    names = self.class.all_units_sharing_any_roster(self).pluck(:name).map(&:downcase)
    errors.add(:name, "already taken in one of this unit's rosters") if names.include?(name.downcase)
  end
end
