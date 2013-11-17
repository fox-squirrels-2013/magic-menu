require 'spec_helper'

feature "Menu Page" do

  scenario "Guest may see a specific menu page" do
  	m = Menu.create name: 'Tester Menu'
    visit "/menus/#{m.id}"
    expect(page).to have_content("Tester Menu")
  end

  scenario "Guest may see items that belong to a menu" do
  	m = Menu.create name: 'Tester'
  	m.items << Item.create({name: 'test item', price: 123})
    visit '/menus/' + "#{m.id}"
    expect(page).to have_content("test item")
  end


end
