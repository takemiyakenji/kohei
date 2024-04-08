class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :genre
      t.date :time
      t.integer :price
      t.string :form

      t.timestamps
    end
  end
end
