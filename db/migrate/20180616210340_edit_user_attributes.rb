class EditUserAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_digest
    remove_column :users, :uid
    remove_column :users, :token
  end
end
