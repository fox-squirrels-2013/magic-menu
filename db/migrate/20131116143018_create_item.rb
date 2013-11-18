class CreateItem < ActiveRecord::Migration
  def change
      create_table :items do |t|
      t.belongs_to :menu
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
