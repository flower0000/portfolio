class HomesController < ApplicationController
  def top

    @rankings=Recipe.all

    #(後日確認）最初はできていたが途中からできなくなった。
    #@rankings = Recipe.find(Favorite.group(:recipe_id).order("count(recipe_id) desc").limit(3).pluck(:recipe_id))





    #Recipe.find(1,2)  #Recipe.find([1,2])でも可(配列入力可)

    #group(:recipe_id)
    #Favoritesテーブル内のレコードで同じrecipe_idごとにグループを作ってまとめる。
    #(例：Favoritesテーブル内で1番のrecipe_idを保持しているレコードを1つのくくり(グループ)としてまとめる)

    #モデル名.order("並び変えたいカラム名")
    #指定が無ければアルファベット順・あいうえお順。descで降順で並べ替え。

    #order('count(recipe_id) desc')
    #count(recipe_id)した結果をdesc（降順）で並べ変えます

    #count(recipe_id)
    #recipe_idが同じものを数えるメソッド
    #いいねテーブルに保存されているレコードを数えることでいいねの数を取得

    #limit(3)
    #上から3つだけ取得。3を他の数字にすると、上からその数字分のデータだけ取得

    #pluck:特定のカラムの値だけ取得できる
    #モデル（データ）.pluck(:カラム名)で取得可
    #.pluck(:recipe_id)
    #上から3つ取得したデータの各recipe_idを配列に格納して取得

  end

  def about

  end
end
