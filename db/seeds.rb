require 'faker'

10.times do |n|
  breeder = Breeder.create( provider: "email",
    uid: "mail#{n}@example.com",
    email: "mail#{n}@example.com",
    password: "password",
    name: "#{Faker::GameOfThrones.character} #{n}",
    rattery_name: Faker::GameOfThrones.house
  )
  father = Animal.create(
    sex: "male",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something"
  )
  mother = Animal.create(
    sex: "female",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something"
  )
  litter = Litter.create(
    name: "#{Faker::LordOfTheRings.character} #{n}",
    birth_date: Faker::Date.between(2.years.ago, Date.today),
    expected_traits: ["tall", "thin"],
    breeder_id: breeder.id,
    father: father,
    mother: mother
  )
  Animal.create(
    sex: "male",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something",
    litter: litter
  )
  Animal.create(
    sex: "male",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something",
    litter: litter
  )
  Animal.create(
    sex: "female",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something",
    litter: litter
  )
  Animal.create(
    sex: "female",
    name: Faker::HarryPotter.character,
    home_name: Faker::HarryPotter.house,
    phenotype: "something",
    genotype: "something",
    litter: litter
  )
end
