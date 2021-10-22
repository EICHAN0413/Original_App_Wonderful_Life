class ChangeColumnsAddNotnullOnPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :title, :string, null: false
  end
end
