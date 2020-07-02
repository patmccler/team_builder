FactoryBot.define do
  factory :roster_membership do

    transient do
      unit { false }
    end

    roster
    for_warcraft_unit

    trait :for_warcraft_unit do
      after(:build) do |rm, eval|
        rm.unit = eval.unit || (build :warcraft_unit, game: rm.roster.game)
      end
    end

    trait :for_team_fight_tactics_unit do
      after(:build) do |rm, eval|
        rm.unit = eval.unit || (build :team_fight_tactics_unit, game: rm.roster.game)
      end
    end
  end
end