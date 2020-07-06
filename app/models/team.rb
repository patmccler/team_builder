class Team < ApplicationRecord
  belongs_to :roster
  belongs_to :user

  has_many :team_memberships, dependent: :destroy

  accepts_nested_attributes_for :team_memberships

  validates :team_size, numericality: { only_integer: true, less_than_or_equal_to: 40, greater_than_or_equal_to: 1 }
  validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

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
      team_memberships.order(:id)[team_count_difference, -team_count_difference].map(&:delete)
    end
  end
end
