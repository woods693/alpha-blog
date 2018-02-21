class ArticleCategory < ActiveRecord::Base
  #needs to belong to both article and category models
  belongs_to :article
  belongs_to :category
end