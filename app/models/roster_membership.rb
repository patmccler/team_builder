class RosterMembership < ApplicationRecord
  belongs_to :roster
  belongs_to :unit, polymorphic: true

  validate :unit_and_roster_same_game

  def increment_appearances
    increment!(:appearances)
  end

private

  def unit_and_roster_same_game
    errors.add(:unit, "must be from same game as roster") unless roster.game == unit.game
  end
end
