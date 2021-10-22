class ChangeColumnsAddNotnullOnMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :type_name, :string
  end
end
