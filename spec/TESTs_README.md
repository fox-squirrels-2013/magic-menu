Tests to run on release1 menus:
(0) validations: name must be present on the menu
(1) rspec: must validate for presence of name before creating table item
(2) shoulda: clicking on add menu should add the menu to the table
(3) capybara: after clicking, you should be routed to menu/:id which contains 
	"menu_name Menu"