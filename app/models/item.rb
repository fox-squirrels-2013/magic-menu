class Item < ActiveRecord::Base
  validates :name, :format => { :with => /\D+/ }
  validates :price, :format => { :with => /\$\d+\.\d{2}/, :message => "must start with '$', then display dollars and cents, like this: $0.99" }
end
