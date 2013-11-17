class CreateMenusItems < ActiveRecord::Migration
  def change
    create_table :menus_items do |t|
      t.belongs_to :menu
      t.belongs_to :item
    end
  end
end
