class ItemsMenu < ActiveRecord::Base
  validates :price, presence: true, numericality: true
  belongs_to :menu
  belongs_to :item
end

