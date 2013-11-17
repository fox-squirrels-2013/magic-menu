class CreateMenuItemsMenusJoinTable < ActiveRecord::Migration
  def change
    create_table :menu_items_menus do |t|
      t.belongs_to :menu
      t.belongs_to :menu_item
      t.decimal :price

      t.timestamps
    end
  end
end
