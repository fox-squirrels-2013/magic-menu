class Menu < ActiveRecord::Migration
  def change
    create_table :menus do |t| 
      t.string :description
      t.timestamps       
    end 
  end
end
