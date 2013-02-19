class FoodItems < ActiveRecord::Migration
  def up
    create_table :food_items do |t|
      t.string :name
      t.string :plate_position
      t.string :score
    end
  end

  def down
    droptable :food_items
  end
end
