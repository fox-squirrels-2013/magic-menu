require 'spec_helper'

feature "Menu Page" do

  scenario "Guest may see all menu items" do
  	m = Menu.create name: 'Tester'
    visit '/menus/' + "#{m.id}"
    expect(page).to have_content("Items")
  end


end
