class TeamFightTacticsUnit < ApplicationRecord
  # Shared functionality in Unit module
  include Unit

  validates :affiliation, presence: true, length: { maximum: 35 }
  validates :combat_style, presence: true, length: { maximum: 35 }
end
