get '/' do
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  @menu = Menu.find_by_id(params[:menu_id])
  @items = @menu.items
  @possible_items = Item.all
  erb :menu
end

get '/item' do
  @items = Item.all
  erb :item
end

post '/menu/new' do
  if request.xhr?
    @menu = Menu.create(params[:menu])
    content_type :json
    @menu.to_json
  end
end

post '/item/new' do
  if request.xhr?
    @item = Item.create(params[:item])
    content_type :json
    @item.to_json
  end
end

get '/menu/delete/:menu_id' do
  Menu.destroy(params[:menu_id])
end

get '/item/delete/:item_id' do
  Item.destroy(params[:item_id])
end

get '/menu/item/:id' do
  'hello'
  # Offering.create()
end