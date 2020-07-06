FactoryBot.define do
  factory :roster do
    sequence :name do |n|
      "Group of Characters # #{n}"
    end

    unit_type { Roster::UNIT_TYPES[0] }

    description { "All the available characters" }
  end
end