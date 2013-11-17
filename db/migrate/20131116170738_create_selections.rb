class CreateSelections < ActiveRecord::Migration
  def change
  	  create_table :selections do |t|
	      t.belongs_to :menu
	      t.belongs_to :item
	      t.timestamps
	 	end
  end
end
