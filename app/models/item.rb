class Item < ActiveRecord::Base
	validates :name, presence: true
	validates :price, presence: true
	validates :price, format: { with: /\d*\.?\d{2}?/}
	has_many :selections
	has_many :menus, :through => :selections
end