class CreateHowToMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :how_to_makes do |t|
      t.integer :recipe_id
      t.integer :order_no
      t.text :introduction

      t.timestamps
    end
  end
end
