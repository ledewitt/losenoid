class FoodItem < ActiveRecord::Migration
  def up
    create_table :food_item do |t|
      t.string :name
      t.string :plate_position
      t.string :score
    end
  end

  def down
    droptable :food_item
  end
end
