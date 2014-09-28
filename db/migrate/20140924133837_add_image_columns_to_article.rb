class AddImageColumnsToArticle < ActiveRecord::Migration
  def change
    add_attachment :articles, :imgart
  end
end
