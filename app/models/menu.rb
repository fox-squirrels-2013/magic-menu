class Menu < ActiveRecord::Base
  has_many :items_menus
  has_many :items, through: :items_menus
  validates :title, presence: true
end
