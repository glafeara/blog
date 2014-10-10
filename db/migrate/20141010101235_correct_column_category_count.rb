class CorrectColumnCategoryCount < ActiveRecord::Migration
  def change
    remove_column :categories, :category_count
    add_column :categories, :articles_count, :integer, default: 0
  end
end
