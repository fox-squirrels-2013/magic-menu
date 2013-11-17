class Item < ActiveRecord::Base
  has_many :item_menus
  has_many :menus, through: :item_menus
  validates :title, :cost, presence: true
end
