class Lists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :menu
      t.belongs_to :item

      t.timestamps
    end
  end
end
