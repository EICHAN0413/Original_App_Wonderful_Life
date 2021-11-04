class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string, null: false, default: ""
    add_column :users, :uid, :string, null: false, default: "" 
    add_index :users, [:uid], unique: true
  end
end
