class Animal < ApplicationRecord
  belongs_to :litter
  has_one :breeder, through: :litter
end
