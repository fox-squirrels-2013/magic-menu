require "spec_helper"

feature "Item creation" do
  scenario "Making a new item with valid name and price" do
    page.visit "/items"
    page.fill_in "name", :with => "Turkey sandwich"
    page.fill_in "price", :with => "$3.79"
    page.click_button "Create Item"
    page.should have_content("Turkey sandwich")
  end

  scenario "Making a new item with an invalid name does not work" do
    page.visit "/items"
    page.fill_in "name", :with => "90909090"
    page.fill_in "price", :with => "$4.00"
    page.click_button "Create Item"
    page.should_not have_content("90909090")
  end

  scenario "Making a new item with an invalid price does not work" do
    page.visit "/items"
    page.fill_in "name", :with => "Ham sandwich"
    page.fill_in "price", :with => "$4"
    page.click_button "Create Item"
    page.should_not have_content("Ham sandwich")
  end
end