get '/' do
  # Look in app/views/index.erb
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  @menu = Menu.find_by_id(params[:menu_id])
  erb :menu
end

get '/item' do
  @items = Item.all
  erb :item
end

post '/menu/new' do
  params[:menu]
  Menu.create(params[:menu])
  redirect '/'
end