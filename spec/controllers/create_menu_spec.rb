require 'spec_helper'

feature "Index Page" do

  scenario "Guest may create a menu" do
    visit '/menus'
    fill_in "new_menu_name", with: "Test menu"
    click_on "enlighten the food"

    expect(page).to have_content("Test menu")
  end
end
