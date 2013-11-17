class Menu < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :menu_items_menus
  # has_many :menu_items, through :menu_items_menus
  has_and_belongs_to_many :menu_items_menus
end
