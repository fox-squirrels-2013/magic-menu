class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menuitems do |t|
      t.belongs_to :menu
      t.belongs_to :item 
      t.timestamps
    end
  end
end
