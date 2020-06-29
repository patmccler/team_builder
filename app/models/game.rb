class Game < ApplicationRecord
  has_many :rosters

  UNIT_TYPES = ["WarcraftUnit", "TeamFightTacticsUnit"]
end
