class Menu < ActiveRecord::Base
  has_many :items, through: :item_menus
  validates_presence_of :name, message: "Name cannot be blank!"
  validates_format_of :name, :with => /^([a-z]|\s|[A-Z])+$/, message: "Name cannot contain invalid characters."
end
