class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :reviews
  has_many :how_to_makes, dependent: destroy
  has_many :recipe_ingredients, dependent: destroy
end
