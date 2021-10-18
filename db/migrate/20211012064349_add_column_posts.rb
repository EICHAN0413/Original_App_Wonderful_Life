class AddColumnPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :recipe_category, :integer
  end
end
