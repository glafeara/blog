class Article < ActiveRecord::Base

  after_create  :increment_articles_count
  after_destroy :decrement_articles_count

  belongs_to    :category
  belongs_to    :user
  has_many      :comments,    dependent: :destroy

  validates     :header,      presence: true, length: { minimum: 4, maximum: 150 }
  validates     :description, presence: true, length: { minimum: 200, maximum: 500 }
  validates     :article,     presence: true, length: { minimum: 300, maximum: 20000 }
  validates     :category_id, presence: true
  validates     :user_id, 	  presence: true


  private

    def increment_articles_count
      category.increment!(:articles_count)
    end

    def decrement_articles_count
      category.decrement!(:articles_count)
    end

end
