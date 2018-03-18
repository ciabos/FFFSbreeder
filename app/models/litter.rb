class Litter < ApplicationRecord
  belongs_to :breeder
  has_many :animals
end
