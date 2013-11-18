get '/' do
  erb :index
end

#### MENUS #########
get '/menus' do
  @menus = Menu.all
  erb :menus
end

post '/menus' do
  @menu = Menu.new(params[:menu])
  @menu_id = @menu.id
  if @menu.save
    if request.xhr?
      menu_info = {name: @menu.name, id: @menu.id}
      content_type :json
      menu_info.to_json
    else
      redirect '/menus'
    end
  else
    if request.xhr?
      content_type :json
      {}.to_json
    else
      redirect '/menus'
    end
  end
end

#### EACH MENU ######
get '/menus/:id' do
  @this_menu = Menu.find(params[:id])
  @items = Item.all
  @menu_items = @this_menu.items
  erb :each_menu
end

post '/menus/:id' do
  @this_menu = Menu.find(params[:id])
  p params
  @item = Item.find_by_name(params[:name])
  @this_menu.items << @item
  if request.xhr?
    menu_item = {id: @item.id, name: @item.name, price: @item.price}
    content_type :json
    menu_item.to_json
  end
end

post '/menus/:id/items' do
  menu = Menu.find(params[:id])
  menu.items.destroy(params[:item_id])
  200
end

#### ITEMS #########
get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  @item = Item.new(params[:item])
  if @item.save
    if request.xhr?
      item_info = {name: @item.name, price: @item.price}
      content_type :json
      item_info.to_json
    else
      redirect '/items'
    end
  else
    if request.xhr?
      content_type :json
      {}.to_json
    else
      redirect '/items'
    end
  end
end

