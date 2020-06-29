class Roster < ApplicationRecord
  belongs_to :game

  has_many :roster_memberships

  def units
    roster_memberships.map(&:unit)
  end
end
