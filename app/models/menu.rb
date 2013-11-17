class Menu < ActiveRecord::Base
	validates :name, presence: true
	has_many :selections
	has_many :items, :through => :selections
end