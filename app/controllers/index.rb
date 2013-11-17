get '/' do
  @menu = Menu.all
  erb :index
end

get '/menu' do
  # Look in app/views/index.erb
  @menu = Menu.all
  erb :index, :layout => false
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
  m = Menu.create(params)
  @menu = Menu.all
  # erb :index
  m = {title: m.title, id: m.id}
  content_type :json
  m.to_json
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
  erb :item, :layout => false
end

post '/item' do
  p params
  m = Item.create(params)
  @item = Item.all
  m = {title: m.title, cost: m.cost}
  content_type :json
  m.to_json
end

put '/item' do
end

delete '/item' do
end

get '/:anything' do
  @menu = Menu.all
  erb :index
end