require "spec_helper"

feature "Menu creation" do
  scenario "Making a new menu with valid, unique name" do
    page.visit "/"
    page.fill_in "name", :with => "Jimmy's Menu"
    page.click_button "Create Menu"
    page.should have_content("Jimmy's Menu")
  end

  scenario "Making a new menu with an invalid name does not work" do
    page.visit "/"
    page.fill_in "name", :with => "482391"
    page.click_button "Create Menu"
    page.should_not have_content("482391")
  end
end