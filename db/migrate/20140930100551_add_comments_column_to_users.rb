class AddCommentsColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :comments, :integer
  end
end
