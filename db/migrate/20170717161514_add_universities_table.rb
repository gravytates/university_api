class AddUniversitiesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :description
      t.integer :population
      t.string :mascot

      t.timestamps
    end
  end
end
