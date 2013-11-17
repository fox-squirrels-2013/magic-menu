class Item < ActiveRecord::Base
  has_many :menus_items
  has_many :menus, through: :menus_items
  

  validates :name, presence: true
  validates :price, presence: true
  # Remember to create a migration!
end


