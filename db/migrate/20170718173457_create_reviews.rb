class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :university_id
      t.string :author
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
