class DropMaterialCategoryTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :material_categories
  end
end
