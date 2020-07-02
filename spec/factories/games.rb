FactoryBot.define do
  factory :game do
    sequence :name do |n|
      "Warcraft # #{n}"
    end
    unit_type { Game::UNIT_TYPES.first }
  end
end