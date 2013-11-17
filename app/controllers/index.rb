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

get '/menus/update/:id' do 
  @menu = Menu.find(params[:id])
  @items = Item.all
  erb :update_menu
end

post '/menus/update/:id' do 
  @menu = Menu.find(params[:id])
  p @menu
  @item = Item.create(params[:item])
  p @item.id
  @items = Item.all
  @join = MenuItems.create(menu_id: @menu.id, item_id: @item.id)
  @menu.update_attributes(params[:menu])
  p params
  if request.xhr?
    item = {name: @item.name, price: @item.price}
    content_type :json
    item.to_json
  else
    redirect "/menus/update/#{params[:id]}"
  end
end

delete '/menus/delete/:id' do
  Menu.find(params[:id]).destroy
  redirect '/menus'
end

# ///////////////////////////////////////////
