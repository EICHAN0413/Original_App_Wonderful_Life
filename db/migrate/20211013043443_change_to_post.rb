class ChangeToPost < ActiveRecord::Migration[5.2]
  def down
    remove_column :posts, :amount, :string
    remove_column :posts, :material, :string
    remove_column :materials, :type_name, :string
  end
end
