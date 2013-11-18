class Menu < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :items_menus
  has_many :items, through: :items_menus
  # has_and_belongs_to_many :menu_items_menus
end


