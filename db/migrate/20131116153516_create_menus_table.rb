class CreateMenusTable < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name

      t.timestamp
    end
  end
end
