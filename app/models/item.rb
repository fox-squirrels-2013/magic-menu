class Item < ActiveRecord::Base
  validates :description, presence: true 
  validates :price, numericality: true 
  has_many :singlemenus 
  has_many :menus, through: :singlemenus 
end
