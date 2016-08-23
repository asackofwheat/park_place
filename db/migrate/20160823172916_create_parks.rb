class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :parkname
      t.string :parktype
      t.string :score
      t.string :zipcode

      t.timestamps
    end
  end
end
