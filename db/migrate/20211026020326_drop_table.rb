class DropTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_recipe_categories
  end
end
