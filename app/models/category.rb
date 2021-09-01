class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_topics
  has_many :topics, through: :categories_topics, dependent: :destroy
end
