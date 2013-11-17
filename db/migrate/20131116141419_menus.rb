class Menus < ActiveRecord::Migration
  def change
     create_table :menus do |t|
      t.string :title

      t.timestamps
    end

    create_table :items do |t|
      t.string :title
      t.string :cost

      t.timestamps
    end

    create_table :item_menus, id: false do |t|
      t.integer :item_id
      t.integer :menu_id
    end
  end
end
