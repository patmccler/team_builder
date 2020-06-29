class RosterMembership < ApplicationRecord
  belongs_to :roster
  belongs_to :unit, polymorphic: true
end
