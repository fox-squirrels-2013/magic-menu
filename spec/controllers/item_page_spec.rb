require 'spec_helper'

feature "Viewing items" do
  scenario "Guest may see all current items" do
    visit '/items'

    expect(page).to have_content("Your Items:")
  end
end
