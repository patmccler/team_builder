module Unit
  def self.included(base)
    include_relations(base)
    include_validations(base)
    define_private_methods(base)
  end

  def self.include_relations(base)
    base.class_eval do
      belongs_to :game

      has_many :team_memberships, as: :unit
      has_many :teams, through: :team_memberships

      has_many :roster_memberships, as: :unit
      has_many :rosters, through: :roster_memberships
    end
  end

  def self.include_validations(base)
    base.class_eval do
      validates :name, presence: true

      validate :name_unique_in_rosters, if: :name_changed?

      scope :all_units_sharing_any_roster, ->(unit) {
        joins(:roster_memberships).where(roster_memberships: { roster: unit.roster_memberships.map(&:roster_id) })
      }
    end
  end

  def self.define_private_methods(base)
    base.class_eval do
      def name_unique_in_rosters
        names = self.class.all_units_sharing_any_roster(self).pluck(:name).map(&:downcase)
        errors.add(:name, "already taken in one of this unit's rosters") if names.include?(name.downcase)
      end

      private :name_unique_in_rosters
    end
  end

  private_class_method :include_relations, :include_validations, :define_private_methods
end
