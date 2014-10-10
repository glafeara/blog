class Comment < ActiveRecord::Base

  after_create  :increment_comments_count
  after_destroy :decrement_comments_count

  belongs_to    :user
  belongs_to    :article

  validates     :comment,    presence: true, length: { minimum: 10, maximum: 250 }
  validates     :article_id, presence: true


  private

    def increment_comments_count
      user.increment!(:comments_count) && article.increment!(:comments_count)

    end

    def decrement_comments_count
      user.decrement!(:comments_count) && article.decrement!(:comments_count)
    end

end