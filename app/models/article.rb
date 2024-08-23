class Article < ApplicationRecord
  # ActiveRecord automatically declares attributes for every column
  # in the table so they don't have to be specified here

  has_many :comments
  
  # validations are checked before the model is saved
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
