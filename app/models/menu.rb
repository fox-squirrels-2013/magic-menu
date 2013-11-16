class Menu < ActiveRecord::Base
  validates :name, :uniqueness => true, :format => { :with => /\D+/ }
end
