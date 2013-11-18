class Mitem < ActiveRecord::Base
	belongs_to :menu
  belongs_to :item
end