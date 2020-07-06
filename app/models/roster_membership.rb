class RosterMembership < ApplicationRecord
  belongs_to :roster
  belongs_to :unit, polymorphic: true

  def increment_appearances
    increment!(:appearances)
  end

end
