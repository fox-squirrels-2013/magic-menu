class Item < ActiveRecord::Base
  validates_presence_of :name, message: "Item names need to exist"
  validates_presence_of :price, message: "Items need prices"
  validates_uniqueness_of :name, message: "That item already exists"

  has_many :lists
  has_many :menus, through: :lists
end
