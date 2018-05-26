class Litter < ApplicationRecord
  belongs_to :breeder
  belongs_to :father, class_name: "Animal", optional: true
  belongs_to :mother, class_name: "Animal", optional: true
  has_many :animals
end
