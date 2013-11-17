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

# ///////////////////////////////////
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
    item = {name: @item.name, price: @item.price}
    content_type :json
    item.to_json
  else
    redirect "/menus/update/#{params[:id]}"
  end
end

# ///////////////////////////////////
get '/menus/delete/:id' do
  @menus = Menu.all
  @menu = Menu.find(params[:id])
  erb :index
end

post '/menus/delete/:id' do
  @menus = Menu.all
  @menu = Menu.find(params[:id])
  # @menu.destroy
  # if request.xhr?
    
  # else
    redirect '/'
  # end
end

# ///////////////////////////////////
post '/menusitems/delete/:id' do
  @menu = Menu.find(params[:id])
  @item = Item.find(params[:id])
  @item.destroy
  redirect '/'
end

# ///////////////////////////////////////////
