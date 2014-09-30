class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :article

  validates  :comment,    presence: true, length: { minimum: 10, maximum: 250 }
  validates  :article_id, presence: true

end