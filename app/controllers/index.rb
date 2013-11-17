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

post '/' do
  puts params
  Menu.create(:name => params["menu_name"])
  @menus = Menu.all
  erb :menu_listing
end

get '/menus/:id' do
  @menu = Menu.find_by_id(params[:id])
  @all_items = Item.all
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :menu
end

post '/menus/:id' do
  item_id = params["item_id"]
  menu_id = params["menu_id"]
  ItemMenu.create(:item_id => item_id, :menu_id => menu_id)
  @menu = Menu.find_by_id(params[:id])
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :items_on_menu
end

delete '/menus/:id' do
  item_id = params["item_id"].to_i
  menu_id = params["menu_id"].to_i
  ItemMenu.find_each do |item_menu|
    if (item_menu.item_id == item_id) && (item_menu.menu_id == menu_id)
      item_menu.destroy
      break
    end
  end
  @menu = Menu.find_by_id(params[:id])
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :items_on_menu
end

get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  Item.create(:name => params["item_name"], :price => '$' + params["item_price"])
  @items = Item.all
  erb :items_table
end