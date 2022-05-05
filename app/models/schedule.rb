class Schedule < ApplicationRecord
  has_rich_text :note
  belongs_to :user

  def self.search(term)
    self.where("lower(event) LIKE lower(?)", "%#{term}%")
  end 
end
