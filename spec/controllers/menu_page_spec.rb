require 'spec_helper'

feature "Menu Page" do

	scenario "Guest may see a specific menu page" do
		m = Menu.create name: 'Tester Menu'
		visit "/menus/#{m.id}"
		expect(page).to have_content("Tester Menu")
	end

	scenario "Guest may see items that belong to a menu" do
		m = Menu.create name: 'Tester'
		m.items << Item.create({name: 'test item', price: 123})
		visit '/menus/' + "#{m.id}"
		expect(page).to have_content("test item")
	end

	scenario "Guest may see a select box" do
		m = Menu.create name: 'Tester'
		visit '/menus/' + "#{m.id}"
		expect(page).to have_select("item_select")
	end

	scenario "Guest may see a list of items that can be added to menu" do
		m = Menu.create name: 'Tester'
		m.items << Item.create({name: 'test item', price: 123})
		visit '/menus/' + "#{m.id}"
		page.has_select?("item_select", selected: "#{m.items.last.name}")
	end

	scenario "Selecting an item adds that item to the current menu" do
		m = Menu.create name: 'Tester'
		i = Item.create({name: 'test item', price: 123})
		m.items << i
		visit '/menus/' + "#{m.id}"
		select("#{i.name}", from: "item_select")
		visit '/menus/' + "#{m.id}"
		within_table('item_table') do
			expect(page).to have_content("#{i.name}")	
		end
	end

end
