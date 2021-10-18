class RemoveColumnToPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :procedure, :text
    remove_column :posts, :procedure_image, :text
  end
end
