FactoryBot.define do
  factory :roster do
    game
    sequence :name do |n|
      "Group of Characters # #{n}"
    end

    description { "All the available characters" }
  end
end