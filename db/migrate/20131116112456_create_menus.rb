class CreateMenus < ActiveRecord::Migration
  def change
  	create_table :menus do |t|
  		t.text :name
  	end
  end
end
