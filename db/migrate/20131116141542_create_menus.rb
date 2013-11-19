class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps 
    end
  end
end
