class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"
  #class_name: ‘User’ と補足設定することで、following,followerという存在しないクラスを参照することを防ぎ、User クラスであることを明示
  #「followモデルなんて存在しないので、userモデルにbelongs_toしてね！」って事
  #followingはフォローしている側のユーザー
  #followerはフォローされている側のユーザー
  
  validates :following_id, presence: true
  validates :follower_id, presence: true

end
