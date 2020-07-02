class TeamMembership < ApplicationRecord
  belongs_to :team
  belongs_to :unit, polymorphic: true, optional: true

  before_save :increment_change_count, if: :unit_id_changed?

private

  def increment_change_count
    self.change_count += 1
  end
end
