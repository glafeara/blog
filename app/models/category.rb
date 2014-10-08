class Category < ActiveRecord::Base

  has_many  :articles, dependent: :destroy

  validates :category, presence: true, length: { minimum: 2, maximum: 75 }

  
end
