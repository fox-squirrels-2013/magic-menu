class Menu < ActiveRecord::Base
  has_many :item_menus
  has_many :items, through: :item_menus
  validates :title, presence: true
end
