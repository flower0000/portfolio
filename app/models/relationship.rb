class Relationship < ApplicationRecord
  belongs_to :following, class_name: "User"
  belongs_to :follower, class_name: "User"

  #belongs_to 変更したい親モデル名, class_name: "元々の親モデル名"
  #これによりUserモデル内にFollowモデル、Followerモデルを擬似的に作り出す
end
