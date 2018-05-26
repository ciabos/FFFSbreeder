FactoryBot.define do
  factory :animal do
    sex "male"
    sequence(:name) { |n| "Animal #{n}" }
    sequence(:home_name) { |n| "Home nr #{n}" }
    phenotype "no idea"
    genotype "no idea"
    additional_info "some extra info"

    trait :male do
      sex "male"
    end

    trait :female do
      sex "female"
    end
  end
end
