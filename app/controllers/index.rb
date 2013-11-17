get '/' do
  if Menu.all
    @menus = Menu.all
  end

  erb :index
end

post '/menus/create/new' do
  @menu = Menu.create name: params[:menu][:name]
  
  redirect '/'
end

get '/menus/:id' do
  @id = params[:id]
  @list_at_menu = List.where menu_id: @id
  @items_at_menu = @list_at_menu.map { |list| Item.find list.item_id }

  @items = Item.all

  erb :menu
end

get '/items' do
  @items = Item.all

  erb :item
end

post '/item/create/new' do
  @item = Item.create(name: params[:item][:name], price: params[:item][:price])

  redirect '/items'
end

put '/menus/:id/add' do
  @add_item = params[:add_item]

  @menu = Menu.find(params[:id])
  @item = Item.find(@add_item)

  @menu.items << @item

  redirect '/menus/' + params[:id]
end
