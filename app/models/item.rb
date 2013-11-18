class Item < ActiveRecord::Base
  # Remember to create a migration!
  has_many :menus, through: :item_menus
  validates_presence_of :name, message: "Name cannot be blank!"
  validates_presence_of :price, message: "Price cannot be blank!"
  validates_format_of :name, :with => /^([a-z]|\s|[A-Z])+$/, message: "Name cannot contain non-letters!"
  validates_format_of :price, :with => /^\d+$|^\d+\.\d\d?$/, message: "Invalid price!  Please use this format: 0.00"
end
