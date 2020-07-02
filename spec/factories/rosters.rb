FactoryBot.define do
  factory :roster do
    game
    name { "Full Cast" }
    description { "All the available characters" }
  end
end