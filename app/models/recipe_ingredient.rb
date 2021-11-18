class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  
  validates :material, presence: true#存在しますか
  validates :quantity, presence: true#存在しますか
  
  #belongs_toで親の外部キーが自動的にvalidationが組まれるよう割り当ててくれている。
  #recipeモデルの外部キーとしてrecipe_idがあるのでそこに既にvalidationを準備してくれている。
  #なので他はvalidationが必要になる。
  
end
