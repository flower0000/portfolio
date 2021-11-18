class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :how_to_makes, dependent: :destroy
  has_many :recipe_ingredients, dependent: :destroy

  accepts_nested_attributes_for :recipe_ingredients, :how_to_makes, allow_destroy: true
  #accepts_nested_attributes_forを使用することで、指定したモデルのデータを配列としてパラメーターに含めることができる。
  #つまり、「recipe」と「recipe_ingredients」「how_to_makes」モデルのデータをまとめて保存できるようになる。
  #allow_destroy: true　→　意味はaccepts_nested_attributes_forを使用した際に dependent: :destroyと同じ意味・役割を持つ

  attachment :dish_photo

  validates :dish, presence: true#存在しますか
  validates :time, presence: true#存在しますか
  validates :money, presence: true#存在しますか

  def favorited_by?(user)#ここの書き方を後で復習→OK
    favorites.where(user_id: user.id).exists?
  end
  #favoritesテーブルの中のuser_idの中にuser.idがいたらtrueを返すの記述
  #()の記述で引数を設定する.あくまで大事のは()の引数入力欄を準備してあげること．ここが対応する．favorited_by?の記述はなんでも良い．
  #(user)→(current_user)とすることでdefの中身のuser.idがcurrent_user_idの記述になる
  #user_idはfavoritesテーブルの中の探したいカラム名なのでこっちは変わらない

end
