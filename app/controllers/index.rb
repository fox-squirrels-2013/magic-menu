get '/' do
  erb :index
end

get '/menus/new' do
  erb :new
end

post '/menus/new' do
  @menu = Menu.create(name: params[:menu_name])

  if request.xhr?
    content_type :json
    {:menu_name => @menu.name, :menu_id => @menu.id}.to_json
  else
    erb :new
  end
  # redirect "/menus/#{@menu.id}"
end

get '/menus/:id' do
  @menu = Menu.find(params[:id])
  erb :menu_id
end

post '/menus/:id' do
  p "*"*80
  p "Inside menus/:id post route."

  @item = Item.find_by_name(params[:menu_item])
  @menu = Menu.find(params[:id])
  @items_menu = ItemsMenu.create(menu_id: @menu.id, item_id: @item.id, price: params[:price])
  p @items_menu
  # Why does the below not work?
  # p @ItemsMenu.all
  if request.xhr?
    content_type :json
    {:menu_name => @menu.name, :item_name => @item.name, :menu_price => @items_menu.price, :items_menu_id => @items_menu.id}.to_json
  end
end

get '/items' do
  erb :items
end

post '/items' do
  @item = Item.create(name: params[:item_name])
  if request.xhr?
    content_type :json
    {:item_name => @item.name, :item_id => @item.id}.to_json
  else
    erb :items
  end
end
