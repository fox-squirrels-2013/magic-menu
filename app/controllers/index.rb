get '/' do
  erb :index
end

get '/menus/new' do
  erb :new
end

post '/menus/new' do
  @menu = Menu.create(name: params[:menu_name])
  erb :new
  redirect "/menus/#{@menu.id}"
end

get '/menus/:id' do
  erb :menu_id
end

post '/menus/:id' do
  @item = Item.find_by_name(params[:menu_items])
  @items_menu = ItemsMenu.create(menu_id: params[:id], item_id: @item.id, price: params[:price])
  # Why does the below not work?
  # p @ItemsMenu.all
  erb :menu_id
end

get '/items' do
  erb :items
end

post '/items' do
  @item = Item.create(name: params[:item_name])
  erb :items
end