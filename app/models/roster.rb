class Roster < ApplicationRecord
  belongs_to :game
  delegate :unit_type, to: :game

  has_many :roster_memberships

  def units
    roster_memberships.map(&:unit)
  end

  def name_with_game
    game.name + " - " + name
  end
end
