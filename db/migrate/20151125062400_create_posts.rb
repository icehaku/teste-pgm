class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, index: true, foreign_key: true
      t.string :nome
      t.text :content

      t.timestamps null: false
    end
  end
end
