class Menu < ActiveRecord::Base
  has_many :menu_to_menu_items
  has_many :menu_items, through :menu_to_menu_items
end
