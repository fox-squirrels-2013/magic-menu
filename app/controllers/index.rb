get '/' do
	@menu = Menu.all
  erb :index
end

post '/' do
	Menu.create(name: params[:menu_name])
	erb :index
end
