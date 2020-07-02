FactoryBot.define do
  factory :warcraft_unit do
    game
    name { "Protection Warrior" }
    role { WarcraftUnit::ROLE_VALUES.first }
  end
end