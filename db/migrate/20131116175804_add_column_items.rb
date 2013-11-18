class AddColumnItems < ActiveRecord::Migration
  def change
  	add_column :items, :menu_id, :integer
  end
end
