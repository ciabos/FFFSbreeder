class AddReferencesBetweenModels < ActiveRecord::Migration[5.1]
  def change
    add_reference :animals, :litter
    add_reference :litters, :breeder, index: true, foreign_key: true, null: false
    add_reference :litters, :father, foreign_key: { to_table: :animals }
    add_reference :litters, :mother, foreign_key: { to_table: :animals }
  end
end
