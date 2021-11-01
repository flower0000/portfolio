class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  #validation
  validates :score, presence: true#存在しますか
end
