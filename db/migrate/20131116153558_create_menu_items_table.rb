class CreateMenuItemsTable < ActiveRecord::Migration
  def change
      create_table :menu_items do |t|
        t.string :name
        # t.decimal :price

        t.timestamp
      end
    end
  end
