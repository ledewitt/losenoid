class Menu < ActiveRecord::Migration
  def up
    create_table :menu do |t|
      t.string :main
      t.string :side
    end
  end

  def down
    drop_table :menu
  end
end
