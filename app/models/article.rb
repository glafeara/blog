class Article < ActiveRecord::Base

  belongs_to :category
  belongs_to :user

  validates  :header,      presence: true, length: { minimum: 4, maximum: 150 }
  validates  :description, presence: true, length: { minimum: 200, maximum: 500 }
  validates  :article,     presence: true, length: { minimum: 300, maximum: 20000 }
  validates  :user_id, 	   presence: true


end
