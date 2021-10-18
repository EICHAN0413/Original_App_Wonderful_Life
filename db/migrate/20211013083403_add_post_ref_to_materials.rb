class AddPostRefToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :post, foreign_key: true
  end
end
