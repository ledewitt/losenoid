class Menus4 < ActiveRecord::Migration
  def up
    change_table :menus do |t|
      t.remove :tuseday_side
      t.string :tuesday_side
    end
  end

  def down
    drop_table :menus
  end
end
