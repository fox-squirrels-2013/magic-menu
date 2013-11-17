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

    create_table :items_menus, id: false do |t|
      t.belongs_to :item
      t.belongs_to :menu
      t.integer :item_id
      t.integer :menu_id
    end
  end
end
