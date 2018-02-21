class Category < ActiveRecord::Base
  validates :name, presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 15 }
end