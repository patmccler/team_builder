class WarcraftUnit < ApplicationRecord
  # Shared functionality in Unit module
  include Unit

  ROLE_VALUES = %w[Tank DPS Healer].freeze

  validates :buff, length: { maximum: 40 }
  validates :role, inclusion: { in: ROLE_VALUES }, presence: true
end
