FactoryBot.define do
  factory :litter do
    sequence(:name) { |n| "Litter nr #{n}" }
    birth_date Time.zone.now
    expected_traits { ["wysoki", "chudy"] }
    association :breeder
    association :father, factory: [:animal, :male], name: "Father"
    association :mother, factory: [:animal, :female], name: "Mother"
  end
end
