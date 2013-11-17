class Menu < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :lists
  has_many :items, through: :lists
end
