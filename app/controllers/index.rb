get '/' do
  @menus = Menu.all
  erb :index
end

post '/' do
  @menu = Menu.create(name: params[:name])
  if request.xhr?
    menu_name = {id: @menu.id, name: @menu.name}
    content_type :json
    menu_name.to_json
  else
    redirect '/'
  end
end

# MENU UPDATE ///////////////////////////////////
get '/menus/update/:id' do
  @menu = Menu.find(params[:id])
  @items = Menu.find(params[:id]).items
  erb :update
end

post '/menus/update/:id' do
  @menu = Menu.find(params[:id])
  @item = Item.create(params[:item])
  Menuitem.create(menu_id: @menu.id, item_id: @item.id)
  @menu.update_attributes(params[:menu])
  if request.xhr?
    item = {menu_id: @menu.id, id: @item.id, name: @item.name, price: @item.price}
    content_type :json
    item.to_json
  else
    redirect "/menus/update/#{params[:id]}"
  end
end

# MENU DELETE ///////////////////////////////////
get '/menus/delete/:id' do
  @menus = Menu.all
  @menu = Menu.find(params[:id])
  erb :index
end

delete '/menus/delete/:id' do
  @menus = Menu.all
  @menu = Menu.find(params[:id])
  @menu.destroy
  if request.xhr?
    menu_to_delete = {id: @menu.id, name: @menu.name}
    content_type :json
    menu_to_delete.to_json
  else
    redirect '/'
  end
end

# ITEMS DELETE ///////////////////////////////////
get '/menuitem/delete/:item_id' do
  @item = Item.find(params[:item_id])
  @items = Menu.find(params[:id]).items
  @menu = Menu.find(params[:menu][:id])
  erb :update
end

delete '/menuitem/delete/:item_id' do
  @menu = Menu.find(params[:menu][:id])
  @items = @menu.items
  @item = Item.find(params[:item_id])
  @item.destroy
  if request.xhr?
    item_to_delete = {id: @menu.id, item_id: @item.id, name: @item.name, price: @item.price}
    content_type :json
    item_to_delete.to_json
  else
    redirect "/menus/update/#{@menu.id}"
  end
end

# /////////////////////////////////////////////////
