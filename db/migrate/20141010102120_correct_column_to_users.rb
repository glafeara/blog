class CorrectColumnToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :comments
    add_column :users, :comments_count, :integer, default: 0
  end
end
