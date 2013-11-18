class ItemMenu < ActiveRecord::Base
  belongs_to :item
  belongs_to :menu
  validates_uniqueness_of :item_id, scope: :menu_id
end
