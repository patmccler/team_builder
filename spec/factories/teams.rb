FactoryBot.define do
  factory :team do
    sequence :name do |n|
      "Team # #{n}"
    end
    roster
    user
    team_size { 3 }
  end
end