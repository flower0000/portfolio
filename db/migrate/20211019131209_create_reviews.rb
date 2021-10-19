class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.text :comment
      t.float :score

      t.timestamps
    end
  end
end
