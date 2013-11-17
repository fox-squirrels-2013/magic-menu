class Item < ActiveRecord::Base
  has_many :items_menus
  has_many :menus, through: :items_menus
  belongs_to :menu
  validates :title, :cost, presence: true
end
