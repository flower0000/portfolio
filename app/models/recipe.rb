class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites
  has_many :reviews
  has_many :how_to_makes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy
  
  accepts_nested_attributes_for :recipe_ingredients, :how_to_makes, allow_destroy: true
  #accepts_nested_attributes_forを使用することで、指定したモデルのデータを配列としてパラメーターに含めることができる。
  #つまり、「recipe」と「recipe_ingredients」「how_to_makes」モデルのデータをまとめて保存できるようになる。
  
  attachment :dish_photo


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
