class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :following_id
      t.integer :follower_id
      #外部キーとしてリファレンス型を用いるとデータベース(db)内で処理されるので処理速度が圧倒的に早くなるメリットがある。

      t.timestamps
    end
  end

end
