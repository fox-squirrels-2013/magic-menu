get '/' do
  @menu = Menu.all
  erb :index
end

get '/menu' do
  # Look in app/views/index.erb
  @menu = Menu.all
  erb :index
end

get '/menu/:id' do
  # Look in app/views/index.erb
  p params
  @menu = Menu.find_by_id(params[:id])
  p @items_from_menu = @menu.items
  @items = Item.all
  erb :item_menu
end

post '/menu' do
  p params
  p Menu.create(params)
  @menu = Menu.all
  erb :index
end

put '/menu/:id' do
  p params
  add_item = 2
  id = 2
  @menu = Menu.find_by_id(params[:id])
  @menu.items << Item.find_by_id(params[:add_item])
  @items_from_menu = @menu.items
  @items = Item.all
  erb :item_menu
end

delete '/menu' do
end

get '/item' do
  p "This hit the item view, woo!"
  @item = Item.all
  erb :item
end

post '/item' do
  p params
  p Item.create(params)
  @item = Item.all
  erb :item
end

put '/item' do
end

delete '/item' do
end

get '/:anything' do
  @menu = Menu.all
  erb :index
end