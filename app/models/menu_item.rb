class MenuItem < ActiveRecord::Base
  has_many :menu_to_menu_items
  has_many :menus, through :menu_to_menu_items
end
