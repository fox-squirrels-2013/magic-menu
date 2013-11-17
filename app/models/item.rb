class Item < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  validates_uniqueness_of :name

  has_many :lists
  has_many :menus, through: :lists
end
