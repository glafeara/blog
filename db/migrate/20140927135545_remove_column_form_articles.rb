class RemoveColumnFormArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :imgart_file_name
    remove_column :articles, :imgart_content_type
    remove_column :articles, :imgart_file_size
    remove_column :articles, :imgart_updated_at
  end
end
