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



  #フォロー機能
  #フォローする側のUserからみたRelationshipをactive_relationship
  #フォローされる側のUserからみたRelationshipをpassive_relationship
    # ====================自分がフォローしているユーザーとの関連 ===================================
  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  # ========================================================================================

  # ====================自分がフォローされるユーザーとの関連 ===================================
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  # =======================================================================================
  
  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    #簡潔言うとフォロー済みですか？メソッド
    passive_relationships.find_by(following_id: user.id).present?
  end
  #--ここまで--

end
