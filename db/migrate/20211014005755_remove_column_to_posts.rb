class RemoveColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :amount, :string
    remove_column :posts, :material, :string
  end
end
