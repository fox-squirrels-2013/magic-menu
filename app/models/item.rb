class Item < ActiveRecord::Base
  validates_presence_of :name, message: "Please enter an item name"
  validates_presence_of :price, message: "Please enter a price"
  belongs_to :menu
end
