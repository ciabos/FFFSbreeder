class Breeder < ApplicationRecord
  has_many :litters
  has_many :animals, through: :litters
end
