class AddCategoryToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :category, null: true, foreign_key: true
  end
end
