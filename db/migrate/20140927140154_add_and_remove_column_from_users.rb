class AddAndRemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :login
    remove_column :users, :password
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
