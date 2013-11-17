class Menu < ActiveRecord::Base
  has_many :items_menus
  has_many :items, through: :items_menus
  belongs_to :item
  validates :title, presence: true
end
