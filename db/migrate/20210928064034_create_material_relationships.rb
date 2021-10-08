class CreateMaterialRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :material_relationships do |t|
      t.references :material_category, foreign_key: true
      t.references :material, foreign_key: true
      t.timestamps
    end
  end
end
