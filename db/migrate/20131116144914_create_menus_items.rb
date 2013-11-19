class CreateMenusItems < ActiveRecord::Migration
  def change
    create_table :menus_items do |t|
      t.integer :menu_id
      t.integer :item_id
    end
  end
end
