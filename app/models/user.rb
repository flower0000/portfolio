class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  #シンボルとは
  #:〇〇が付く文字列。内部で数字で保存されている。

  #第一引数でrecipes。第2引数でdependent: :destroyが入る。
  #メソッドの最後の引数に{}が必要な記述がある場合にはそれは省略できる。
  #{キー: :値(シンボルのこと)}。has_manyのメソッドでこの内容を要求している。
  #{dependent: :destroy}→dependent: :destroyに省略可能
  #ハッシュの記述の仕方として{:太郎=>185}→{太郎: 185}が現在ではよく使われている。
  #シンボルはPC側から見たら容量が軽いため、動作が軽くなるためこの形で管理されている。
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
