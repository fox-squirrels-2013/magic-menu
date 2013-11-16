get '/' do
  # Look in app/views/index.erb
  @menus = Menu.all
  erb :index
end
