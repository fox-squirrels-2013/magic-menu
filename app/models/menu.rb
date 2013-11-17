class Menu < ActiveRecord::Base
	validates_presence_of :name

	# has_many   :items
	has_and_belongs_to_many :items
end
