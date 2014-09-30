class Comment < ActiveRecord::Base

  before_create { self.user_id.to_i }

  belongs_to :user
  belongs_to :article

  validates  :comment,    presence: true, length: { minimum: 10, maximum: 250 }
  validates  :article_id, presence: true

end