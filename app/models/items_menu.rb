class ItemsMenu < ActiveRecord::Base
  validates :price, presence: true, numericality: true
  validates :item_id, uniqueness: { scope: :menu_id, message: "The same item can only appear once per menu!!!" }
  belongs_to :menu
  belongs_to :item
end

