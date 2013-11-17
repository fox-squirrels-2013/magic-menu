class Item < ActiveRecord::Base
  validates :name, :price, presense: true
end
