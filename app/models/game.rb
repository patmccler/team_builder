class Game < ApplicationRecord
  has_many :rosters, dependent: :destroy

  UNIT_TYPES = ["WarcraftUnit", "TeamFightTacticsUnit"]
end
