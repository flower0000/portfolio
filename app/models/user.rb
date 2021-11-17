class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true#存在しますか
  #emailのバリデーションは既に準備されていた(おそらくdevise側)


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
  #フォローする側のUserからみたRelationship(中間テーブル)をactive_relationship
  #フォローされる側のUserからみたRelationship(中間テーブル)をpassive_relationship
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  #active_relationshipsは現時点では無いためここで定義。中間テーブルはRelationshipモデルでることを設定。
  #relaitonshipsテーブルにアクセスする時、following_idを入口として来てね！」っていう事

  has_many :followings, through: :active_relationships, source: :follower
  #through: :active_relationshipsはactive_relationshipsが中間テーブルであると設定
  #ここのfollowingsはfollowingの複数形だがフォローする側の人から見たフォローしている人達のことをfollowingと定義(元々無い)。
  #アソシエーションのhas manyの後ろに来るのでfollowingsと記述
  #relationshipモデルに記述したfollowingとは意味が違うので気を付けること!関係ないよ！

  #source: :follower
  #「relationshipsテーブルのfollower_idを参考にして、followingsモデルにアクセスしてね」って事。
  #結果として、user.followings と打つだけで、user が中間テーブル relationships を取得し、
  #その1つ1つの relationship のfollowing_idから、「フォローしている User 達」を取得することができる。

  #下のように覚える
  #foregin_key = 入口とする外部キー
  #source = 出口とする外部キー(_idは省略)

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following


  def followed_by?(user)
    # 今自分(引数のuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    #簡潔に言うとフォロー済みですか？メソッド
    passive_relationships.find_by(following_id: user.id).present?
  end
  #--ここまで--

end
