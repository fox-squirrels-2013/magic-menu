class ItemMenu < ActiveRecord::Base
  validates :menu_id, presence: true
  validates :item_id, presence: true
end
