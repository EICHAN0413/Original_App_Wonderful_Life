class ChangeToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :birth_date, :date
  end

  def down
    remove_column :users, :birtyday, :integer
  end
end
