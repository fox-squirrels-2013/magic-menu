class Menu < ActiveRecord::Base
  has_many :items, through: :menuitems
  has_many :menuitems
  validates :name, presence: true
end
