class WarcraftUnit < ApplicationRecord
  belongs_to :game

  has_many :team_memberships, as: :unit
  has_many :teams, through: :team_memberships

  has_many :roster_memberships, as: :unit
  has_many :rosters, through: :roster_memberships

end
