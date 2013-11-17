class CreateItemMenus < ActiveRecord::Migration
  def change
    create_table :item_menus do |t|
      t.belongs_to :item 
      t.belongs_to :menu
      t.timestamps
    end
  end
end
