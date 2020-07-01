class Game < ApplicationRecord
  has_many :rosters, dependent: :destroy
  has_many :warcraft_units, dependent: :destroy
  has_many :team_fight_tactics_units, dependent: :destroy

  UNIT_TYPES = ["WarcraftUnit", "TeamFightTacticsUnit"]
end
