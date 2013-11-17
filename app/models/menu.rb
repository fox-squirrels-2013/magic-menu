class Menu < ActiveRecord::Base
  validates :description, presence: true 
  has_many :singlemenus 
  has_many :items, through: :singlemenus
end
