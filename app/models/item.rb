class Item < ActiveRecord::Base
  has_and_belongs_to_many :menus
  validates :name, :format => { :with => /\D+/ }
  validates :price, :format => { :with => /\$\d+\.\d{2}/, :message => "must start with '$', then display dollars and cents, like this: $0.99" }
end
