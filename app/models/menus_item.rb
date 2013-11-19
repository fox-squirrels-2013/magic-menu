class MenusItem < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :menu
  belongs_to :item
end
