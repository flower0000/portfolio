class HowToMake < ApplicationRecord
  belongs_to :recipe

  validates :order_no, presence: true#存在しますか
  validates :introduction, presence: true#存在しますか
  
end
