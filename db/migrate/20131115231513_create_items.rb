class CreateItems < ActiveRecord::Migration
  def change
  	  create_table :items do |t|
  		t.string :name, :price
  		t.timestamps
  	end
  end
end
