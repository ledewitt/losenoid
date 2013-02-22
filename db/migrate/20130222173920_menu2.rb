class Menu2 < ActiveRecord::Migration
  def up
    change_table :menu do |t|
      t.remove :main, :side
      t.string :week
      t.string :sunday_main
      t.string :sunday_side
      t.string :monday_main
      t.string :monday_side
      t.string :tuesday_main
      t.string :tuseday_side
      t.string :wednesday_main
      t.string :wednesay_side
      t.string :thursday_main
      t.string :thursday_side
      t.string :friday_main
      t.string :friday_side
      t.string :saturday_main
      t.string :saturday_side
  
      t.timestamps
    end
  end

  def down
    drop_table :menu
  end
end
