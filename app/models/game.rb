class Game < ApplicationRecord
  has_many :rosters, dependent: :destroy
  has_many :warcraft_units, dependent: :destroy
  has_many :team_fight_tactics_units, dependent: :destroy

  UNIT_TYPES = %w[WarcraftUnit TeamFightTacticsUnit].freeze

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :unit_type, presence: true, inclusion: { in: UNIT_TYPES }
end
