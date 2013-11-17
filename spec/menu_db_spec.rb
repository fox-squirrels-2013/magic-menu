require 'spec_helper'

describe Menu do
  describe '#name' do
    it { should validate_presence_of(:name) }
  end
end

# feature "Menu Creation" do
#   scenario "User creates a new menu" do
#     visit "/"

#     fill_in "menu[name]", :with => "Test"
#     click_button "submit"

#     expect(page).to have_text("Test")
#   end
# end
