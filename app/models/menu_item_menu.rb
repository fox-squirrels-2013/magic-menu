class MenuItemMenu < ActiveRecord::Base
  validates :price, presence: true, numericality: true
  belongs_to :menu
  belongs_to :menu_item
end
