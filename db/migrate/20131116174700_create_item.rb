class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
    t.string :name
    t.integer :price
    t.belongs_to :menu
    t.timestamps
    end
  end
end
