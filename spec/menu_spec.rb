require "spec_helper"

feature "Menu creation" do
  background do
    @name = Faker::Name.name
  end
  scenario "Making a new menu with valid, unique name" do
    page.visit "/"
    page.fill_in "name", :with => @name
    page.click_button "Create Menu"
    page.should have_content(@name)
  end

  scenario "Making a new menu with an invalid name does not work" do
    page.visit "/"
    page.fill_in "name", :with => "482391"
    page.click_button "Create Menu"
    page.should_not have_content("482391")
  end
end

# too hardcoded -- ugly test
feature "Item display on menus" do
  scenario "Displaying an item that is on a menu" do
    page.visit "/menus/1"
    page.should have_content("Turkey sandwich")
  end
end