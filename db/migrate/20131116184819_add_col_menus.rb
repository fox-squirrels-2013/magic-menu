class AddColMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :item_id, :integer
  end
end
