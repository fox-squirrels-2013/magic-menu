class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
    t.string :name
    t.decimal :price, :precision => 6
    t.timestamps
    end
  end
end
