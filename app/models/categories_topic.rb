class CategoriesTopic < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :category, optional: true
end
