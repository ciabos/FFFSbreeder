class Animal < ApplicationRecord
  belongs_to :litter, optional: true
  has_one :breeder, through: :litter
end
