class CreateItemsMenusJoinTable < ActiveRecord::Migration
  def change
    create_table :items_menus do |t|
      t.belongs_to :menu
      t.belongs_to :item
      t.integer :price

      t.timestamps
    end
  end
end
