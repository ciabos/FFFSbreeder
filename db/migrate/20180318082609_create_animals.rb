class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|

      t.timestamps
      t.string :sex
      t.string :name
      t.string :home_name
      t.string :phenotype
      t.string :genotype
      t.text :additional_info
    end
  end
end
