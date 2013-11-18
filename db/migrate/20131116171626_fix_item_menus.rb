class FixItemMenus < ActiveRecord::Migration
  def change
    rename_table :items_menus, :item_menus
  end
end
