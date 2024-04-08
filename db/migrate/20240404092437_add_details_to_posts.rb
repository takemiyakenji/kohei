class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :about, :string
    add_column :posts, :tagu, :string
  end
end
