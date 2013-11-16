get '/' do
	@menus = Menu.all
  erb :index
end
