class Game < ApplicationRecord
  has_many :rosters, dependent: :destroy
  has_many :warcraft_units, dependent: :destroy
  has_many :team_fight_tactics_units, dependent: :destroy

  validates :name, presence: true
  validates :unit_type, presence: true

  UNIT_TYPES = ["WarcraftUnit", "TeamFightTacticsUnit"]
end
