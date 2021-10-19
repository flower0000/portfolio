class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :dish_photo
      t.string :time
      t.integer :money

      t.timestamps
    end
  end
end
