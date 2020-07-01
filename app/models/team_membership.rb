class TeamMembership < ApplicationRecord
  belongs_to :team
  belongs_to :unit, polymorphic: true, optional: true
end