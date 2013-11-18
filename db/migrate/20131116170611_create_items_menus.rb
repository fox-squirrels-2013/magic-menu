class CreateItemsMenus < ActiveRecord::Migration
  def change
    create_table :items_menus do |t|
      t.belongs_to :menu
      t.belongs_to :item
    end
    remove_column :items, :menu_id
  end
end
