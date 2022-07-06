class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :rating
      t.string :country
      t.text :review
      t.string :brand
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
