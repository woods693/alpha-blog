class Article < ActiveRecord::Base
  #need to add contraints
  #makes sure the object does not have empty title before it hits the database
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence:true, length: { minimum: 3, maximum: 5000 }
  
end