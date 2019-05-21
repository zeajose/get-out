class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :description
      t.string :address
      t.string :price
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
