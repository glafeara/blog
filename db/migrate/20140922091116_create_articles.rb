class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string   :header
      t.text     :description
      t.text     :article
      t.integer  :category_id
      
      t.timestamps
    end
  end
end
