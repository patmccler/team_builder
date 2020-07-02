FactoryBot.define do
  factory :roster_membership do
    roster factory: :roster, name: "TEMP NAME"
    for_warcraft_unit

    trait :for_warcraft_unit do
      association :unit, factory: :warcraft_unit
    end

    # roster and unit should point to same game
    after(:build) { |rm| rm.unit.game = rm.roster.game}

    # TODO: Uncomment after implementing TFT UNIT FACTORY
    # trait :for_team_fight_tactics_unit do
    #   association :unit, factory: team_fight_tactics_unit
    # end
  end
end