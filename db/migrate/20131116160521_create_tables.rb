class CreateTables < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name
      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.string :price
      t.timestamps
    end

    create_table :items_menus do |t|
      t.belongs_to :item
      t.belongs_to :menu
    end
  end
end
