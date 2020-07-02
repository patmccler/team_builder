FactoryBot.define do
  factory :game do
    name { "World of Warcraft" }
    unit_type { Game::UNIT_TYPES.first }
  end
end