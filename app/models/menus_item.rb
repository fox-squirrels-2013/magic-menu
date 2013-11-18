class MenusItem < ActiveRecord::Base
  belongs_to :menu
  belongs_to :item

  validates_uniqueness_of :item_id, :scope => :menu_id
end
