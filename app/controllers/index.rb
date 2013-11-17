get '/' do
  @menus = Menu.all
  erb :index
end

get '/menus' do 
  redirect '/'
end

get '/menus/new' do
  redirect '/'
end

post '/menus' do
  @menu = Menu.create(params)
  if @menu.valid?
    redirect '/'
  else
    @error_messages = @menu.errors.full_messages
    erb :new_menu
  end
end

get '/menus/:id' do
  @menu = Menu.find_by_id(params[:id])
  @all_items = Item.all
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :menu
end

post '/menus/:id' do
  @menu = Menu.find_by_id(params[:id])
end

get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  @item = Item.create(params)
  unless @item.valid?
    @error_messages = @item.errors.full_messages
  end
  @items = Item.all
  erb :items
end