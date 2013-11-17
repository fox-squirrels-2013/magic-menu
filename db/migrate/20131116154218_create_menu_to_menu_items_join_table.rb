class CreateMenuToMenuItemsJoinTable < ActiveRecord::Migration
  def change
    create_table :menu_to_menu_items do |t|
      t.belongs_to :menu
      t.belongs_to :menu_item
      t.decimal :price

      t.timestamps
    end
  end
end
