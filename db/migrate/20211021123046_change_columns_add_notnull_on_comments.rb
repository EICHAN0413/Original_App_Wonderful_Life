class ChangeColumnsAddNotnullOnComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :content, :text, null: false, default: ''

  end
end
