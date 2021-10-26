class DropMaterialRelationships < ActiveRecord::Migration[5.2]
  def change
    drop_table :material_relationships
  end
end
