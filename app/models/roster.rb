class Roster < ApplicationRecord
  belongs_to :game

  UNIT_TYPES = %w[WarcraftUnit TeamFightTacticsUnit].freeze

  has_many :roster_memberships, dependent: :destroy
  has_many :teams, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 140 }

  def units
    roster_memberships.map(&:unit)
  end

  def name_with_game
    game.name + " - " + name
  end

  def add_units(units)
    roster_memberships.build(units.map { |unit| { unit: unit } })
    save
  end
end
