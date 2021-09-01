class Topic < ApplicationRecord
  has_rich_text :note
  belongs_to :user 
  has_many :categories_topics
  has_many :categories, through: :categories_topics, dependent: :destroy

  def self.search(term)
    self.where("lower(name) LIKE lower(?)", "%#{term}%")
  end 

end
