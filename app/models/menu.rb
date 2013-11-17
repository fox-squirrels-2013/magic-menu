class Menu < ActiveRecord::Base
  validates :name, presence: true
  has_many :offerings
  has_many :items, through: :offerings
end
