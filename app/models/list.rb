class List < ActiveRecord::Base
  belongs_to :item
  belongs_to :menu
end
