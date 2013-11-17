class MenuToMenuItem < ActiveRecord::Base
  belongs_to :menus
  belongs_to :menu_items
end
