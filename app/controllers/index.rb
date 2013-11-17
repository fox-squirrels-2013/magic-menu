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
  new_menu = Menu.create(:name => params["menu_name"])
  unless new_menu.valid?
    @error_messages = new_menu.errors.full_messages
  end
  @menus = Menu.all
  erb :index, layout: false
end

get '/menus/:id' do
  @menu = Menu.find_by_id(params[:id])
  @all_items = Item.all
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :menu
end

# post '/menus/:id' do
#   item_id = params["item_id"]
#   menu_id = params["menu_id"]
#   ItemMenu.create(:item_id => item_id, :menu_id => menu_id)
#   @menu = Menu.find_by_id(params[:id])
#   @all_items = Item.all
#   item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
#   @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
#   erb :menu, layout: false
# end

post '/menus/:id' do
  item_id = params["item_id"]
  menu_id = params["menu_id"]
  ItemMenu.create(:item_id => item_id, :menu_id => menu_id)
  item_added = Item.find_by_id(item_id)
  item_added_id = item_id
  item_added_name = item_added.name
  item_added_price = item_added.price
  menu_added_to_id = params[:id]
  {"menu_id" => menu_added_to_id, "item_id" => item_added_id, "item_name" => item_added_name, "item_price" => item_added_price}.to_json
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
  # try using jQuery .remove() to take the one item out of DOM instead of
  # overwriting whole partial
  @menu = Menu.find_by_id(params[:id])
  item_menus = ItemMenu.find_all_by_menu_id(@menu.id)
  @items_on_menu = item_menus.map {|item_menu| Item.find_by_id(item_menu.item_id)}
  erb :items_on_menu, layout: false
end

get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  if params["item_price"]
    new_item = Item.create(:name => params["item_name"], :price => '$' + params["item_price"])
  else
    new_item = Item.create(:name => params["item_name"], :price => '$')
  end
  unless new_item.valid?
    @error_messages = new_item.errors.full_messages
  end
  @error_messages ? (erb :items_form_errors, layout: false) : "no_error"
end