class AddColumnCategoryCountToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :category_count, :integer, default: nil
  end
end
