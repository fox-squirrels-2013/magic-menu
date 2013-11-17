class MenuItem < ActiveRecord::Base
	belongs_to :menu
	belongs_to :item

  validates_uniqueness_of :menu_id, scope: :item_id
end
