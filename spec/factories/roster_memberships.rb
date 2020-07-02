FactoryBot.define do
  factory :roster_membership do

    transient do
      unit { false }
    end

    roster factory: :roster
    for_warcraft_unit

    trait :for_warcraft_unit do
      after(:build) do |rm, eval|
        rm.unit = eval.unit || (build :warcraft_unit, game: rm.roster.game)
      end
    end

    # roster and unit should point to same game
    #after(:build) { |rm| rm.unit.game = rm.roster.game}

    # TODO: Uncomment after implementing TFT UNIT FACTORY
    # trait :for_team_fight_tactics_unit do
    #   after(:build) do |rm, eval|
    #     rm.unit = eval.unit || (build :team_fight_tactics_unit, game: rm.roster.game)
    #   end
    # end
  end
end