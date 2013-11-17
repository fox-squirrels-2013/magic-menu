class Item < ActiveRecord::Base
  has_many :menus, through: :menuitems
  has_many :menuitems
  validates :name, presence: true
  validates :price, presence: true
end
