class AddColumnToMaterial < ActiveRecord::Migration[5.2]
  def up
    add_column :materials, :material, :string
    add_column :materials, :amount, :string
  end
end
