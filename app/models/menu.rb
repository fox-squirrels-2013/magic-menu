class Menu < ActiveRecord::Base
  validates_presence_of :name, message: "Name can't be blank"
  validates_uniqueness_of :name, message: "Name has to be unique"

  has_many :lists
  has_many :items, through: :lists
end
