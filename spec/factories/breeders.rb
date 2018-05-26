FactoryBot.define do
  factory :breeder do
    sequence(:name) { |n| "Breeder #{n}" }
    sequence(:email) { |n| "breeder#{n}@example.com" }
    sequence(:rattery_name) { |n| "Rattery #{n}" }
    password "password"
    confirmed_at Time.zone.now
  end
end
