class CreateSinglemenus < ActiveRecord::Migration
  def change
     create_table :singlemenus do |t| 
      t.belongs_to :item 
      t.belongs_to :menu
      t.timestamps
    end 
  end
end
