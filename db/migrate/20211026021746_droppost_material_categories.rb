class DroppostMaterialCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :post_material_categories
  end
end
