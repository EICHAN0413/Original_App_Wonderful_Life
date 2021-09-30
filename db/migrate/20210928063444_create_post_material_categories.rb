class CreatePostMaterialCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :post_material_categories do |t|
      t.references :post, foreign_key: true
      t.references :material_category, foreign_key: true
      t.timestamps
    end
  end
end
