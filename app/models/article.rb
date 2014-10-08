class Article < ActiveRecord::Base

  after_create :increment_category_count

  belongs_to :category
  belongs_to :user
  has_many   :comments,    dependent: :destroy

  validates  :header,      presence: true, length: { minimum: 4, maximum: 150 }
  validates  :description, presence: true, length: { minimum: 200, maximum: 500 }
  validates  :article,     presence: true, length: { minimum: 300, maximum: 20000 }
  validates  :user_id, 	   presence: true


  private

    def increment_category_count
      category.increment!(:category_count)
    end

end
