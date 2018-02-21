class Article < ActiveRecord::Base
  #setting up association
  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories
  #need to add contraints
  #makes sure the object does not have empty title before it hits the database
  validates :title, presence: true, 
            length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, 
            length: { minimum: 3, maximum: 5000 }
  validates :user_id, presence: true
  
end