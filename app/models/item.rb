class Item < ActiveRecord::Base
  	validates_presence_of :name
  	validates_presence_of :price
  	validates_format_of   :price, with: /\A[$]\d+[.]\d{2}\z/, message: 'Dollar format only ($x.xx)'

    has_and_belongs_to_many :menus
end
