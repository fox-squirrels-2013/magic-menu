class Menu < ActiveRecord::Base
  validates_presence_of :name, message: "Please enter a name for your menu"
end
