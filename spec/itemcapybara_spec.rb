require 'spec_helper'


feature 'Item' do 
  scenario 'valid form inputs create item with description and price' do
  visit '/item'
  fill_in('description', :with => "cookies") 
  fill_in('price', :with => 10)
  click_button('Add Items')
end 
end 
