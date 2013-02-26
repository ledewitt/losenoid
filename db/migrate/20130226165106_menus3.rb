class Menus3 < ActiveRecord::Migration
  def up
    change_table :menus do |t|
      t.remove :wednesay_side
      t.string :wednesday_side
    end
  end

  def down
    drop_table :menus
  end
end
