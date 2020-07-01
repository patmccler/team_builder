class Team < ApplicationRecord
  belongs_to :roster

  has_many :team_memberships

  accepts_nested_attributes_for :team_memberships

  before_save :sync_memberships_with_team_size, if: :team_size_changed?

  # has_many :units, through: :team_memberships wants a table name to work
  # this will allow list of units regardless of which kind
  def units
    team_memberships.map(&:unit)
  end

private

  def sync_memberships_with_team_size
    # determine how many memberships have been added or removed
    team_count_difference = team_size - team_memberships.count

    if team_count_difference.positive?
      team_count_difference.times { team_memberships.build(unit_type: roster.unit_type) }
    else
      # Count back from end of array 'team_count_difference' elements and delete
      t = team_memberships[team_count_difference, -team_count_difference]
      TeamMembership.where(id: t.map(&:id)).delete_all
    end
  end
end
