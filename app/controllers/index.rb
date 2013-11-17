get '/' do
	@menus = Menu.all
  erb :index
end

post '/' do
	Menu.create(name: params[:menu_name])
  erb :index
end
