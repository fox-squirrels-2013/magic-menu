class CreateOfferingsTable < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.belongs_to :menu
      t.belongs_to :item
    end
  end
end
