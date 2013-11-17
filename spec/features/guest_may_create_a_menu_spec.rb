require 'spec_helper'

feature "Creating a menu" do
  scenario "Guest may create a menu" do
    visit '/menus/new'
    fill_in "name", with: "Yumilicious Dinner"
    click_on "Add Menu"

    expect(page).to have_content("Yumilicious Dinner Menu")
  end
end