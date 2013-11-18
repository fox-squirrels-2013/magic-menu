get '/' do
  if Menu.all
    @menus = Menu.all
  end

  erb :index
end

post '/menus/create/new' do
  @menu = Menu.create name: params[:menu][:name]

  @menus = Menu.all

  if @menu.errors.messages != {}
    {name: @menu.errors[:name]}.to_json
  else
    erb :_menu_items, layout: false
  end
end

get '/menus/:id' do
  @id = params[:id]
  @list_at_menu = List.where menu_id: @id
  @items_at_menu = @list_at_menu.map { |list| Item.find list.item_id }

  @menu_name = Menu.find(@id).name.capitalize

  @items = Item.all

  erb :menu
end

get '/items' do
  @all_items = Item.all

  erb :item
end

post '/item/create/new' do
  @item = Item.create(name: params[:item][:name], price: params[:item][:price])

  @all_items = Item.all

  if @item.errors.messages != {}
    {name: @item.errors[:name], price: @item.errors[:price]}.to_json
  else
    erb :_items_list, layout: false
  end
end

put '/menus/:id/update' do
  @add_item = params[:add_item]

  @menu = Menu.find(params[:id])
  @item = Item.find(@add_item)

  @menu.items << @item

  @list_at_menu = List.where menu_id: params[:id]
  @items_at_menu = @list_at_menu.map { |list| Item.find list.item_id }

  erb :_items_in_menu, layout: false
end

delete '/item/:id/delete' do
  Item.find(params[:id]).destroy

  erb :_items_in_menu, layout: false
end
