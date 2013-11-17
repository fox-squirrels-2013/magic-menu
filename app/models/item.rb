class Item < ActiveRecord::Base
  	validates_presence_of :name
  	validates_presence_of :price
  	validates_format_of   :price, with: /\d{3,}/, message: 'Integer format only'

    has_and_belongs_to_many :menus
end
