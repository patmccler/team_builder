FactoryBot.define do
  factory :roster_memberships do
    association :unit, factory: warcraft_unit
    roster
  end
end