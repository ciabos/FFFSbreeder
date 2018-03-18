class CreateLitters < ActiveRecord::Migration[5.1]
  def change
    create_table :litters do |t|
      t.timestamps
      t.string :name
      t.datetime :birth_date
      t.text :expected_traits, array: true, default: []
    end
  end
end
