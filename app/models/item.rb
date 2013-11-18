class Item < ActiveRecord::Base
  has_and_belongs_to_many :menus
  # validates :name, presence: true

end
