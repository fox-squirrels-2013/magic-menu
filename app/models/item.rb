class Item < ActiveRecord::Base
	validates :name, presence: true
	has_many :menus, through: :mitems
end