get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/menus/new' do
  erb :new
end

post '/menus/new' do
  @menu = Menu.create(name: params[:menu_name])
  erb :new
  # redirect "/menus/#{@menu.id}"
end

get '/menus/:id' do
  # params[:id]
  erb :menu_id
end

post '/menus/:id' do
  p "Inside menus/1 post route."
  @item = Item.find_by_name(params[:menu_items])
  @items_menu = ItemsMenu.create(menu_id: params[:id], item_id: @item.id, price: params[:price])

  # Why does the below not work?
  # p @ItemsMenu.all
  # make price match up!
  erb :menu
end

get '/items' do
  erb :items
end

post '/items' do
  @item = Item.create(name: params[:item_name])
  erb :items
end