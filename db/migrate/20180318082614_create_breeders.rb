class CreateBreeders < ActiveRecord::Migration[5.1]
  def change
    create_table :breeders do |t|

      t.timestamps
      t.string :rattery_name
      t.string :email
      t.string :full_name
    end
  end
end
