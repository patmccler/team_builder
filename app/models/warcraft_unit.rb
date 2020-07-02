class WarcraftUnit < ApplicationRecord
  # Shared functionality in Unit module
  include Unit

  validates :buff, length: { maximum: 40 }
end
