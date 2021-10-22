class RemoveConfirmableToDevise < ActiveRecord::Migration[5.2]
  def down

    remove_column :users, :confirmation_token, :string
    remove_column :users, :confirmed_at, :datetime
    remove_column :users, :confirmation_sent_at, :datetime
    remove_column :users, :unconfirmed_email, :string
    remove_index :users, :confirmation_token, unique: true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    execute("UPDATE users SET confirmed_at = NOW()")
end
end
