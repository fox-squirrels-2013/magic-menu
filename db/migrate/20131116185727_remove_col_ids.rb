class RemoveColIds < ActiveRecord::Migration
  def change
  	remove_column :menus, :item_id
  	remove_column :items, :menu_id
  end
end
