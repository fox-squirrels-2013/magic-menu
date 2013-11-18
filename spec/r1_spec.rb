require 'spec_helper'

feature 'Visitor can add menus' do
  scenario 'add menu' do
    fill_in 'input', with: 'menu'

    expect(page).to have_content('menu')

  end
end