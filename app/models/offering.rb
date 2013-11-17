class Offering < ActiveRecord::Base
  validates :item_id, :menu_id, presence: true
  belongs_to :item
  belongs_to :menu
end
