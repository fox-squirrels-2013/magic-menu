class Item < ActiveRecord::Base
  validates :name, :price, presence: true
  has_many :offerings
  has_many :menus, through: :offerings
end
