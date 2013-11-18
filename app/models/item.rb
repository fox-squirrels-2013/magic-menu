class Item < ActiveRecord::Base
  has_many :menus_items
  has_many :menus, through: :menus_items

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
end