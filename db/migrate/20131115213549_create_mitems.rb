class CreateMitems < ActiveRecord::Migration
  def change
  	create_table :mitems do |t|
  		t.belongs_to :menu
  		t.belongs_to :item
    end
  end
end
