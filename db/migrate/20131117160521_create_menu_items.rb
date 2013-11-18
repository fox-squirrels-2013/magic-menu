class CreateItemsMenus < ActiveRecord::Migration
  def change
    create_table :items_menus do |t|
      t.belongs_to :item
      t.belongs_to :menu
    end
  end
end