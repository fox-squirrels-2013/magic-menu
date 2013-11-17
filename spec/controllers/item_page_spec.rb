require 'spec_helper'

feature "Items page" do

  scenario "Guest may see all current items" do
    visit '/items'
    expect(page).to have_content("Your Items:")
  end

  scenario "Guest may create a item" do
    visit '/items'
    fill_in "new_item_name", with: "Test item"
    fill_in "new_item_price", with: 123
    click_on "add item"

    expect(page).to have_content("Test item")
  end  

  scenario "Item price is formatted correctly" do
    visit '/items'
    fill_in "new_item_name", with: "Test item"
    fill_in "new_item_price", with: 123
    click_on "add item"

    expect(page).to have_content("$1.23")
  end

end
