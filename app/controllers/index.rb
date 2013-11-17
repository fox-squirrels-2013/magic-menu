get '/' do
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  @menu = Menu.find_by_id(params[:menu_id])
  @items = @menu.items
  erb :menu
end

get '/item' do
  @items = Item.all
  erb :item
end

post '/menu/new' do
  Menu.create(params[:menu])
  redirect '/'
end

post '/item/new' do
  Item.create(params[:item])
  redirect '/item'
end