class ItemMenu < ActiveRecord::Base
  belongs_to :menu
  belongs_to :item
  validates :item_id, :menu_id, :presence => true
end
