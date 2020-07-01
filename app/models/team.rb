class Team < ApplicationRecord
  belongs_to :roster

  has_many :team_memberships

  accepts_nested_attributes_for :team_memberships

  # has_many :units, through: :team_memberships wants a table name to work
  # this will allow list of units regardless of which kind
  def units
    team_memberships.map(&:unit)
  end
end
