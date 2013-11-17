get '/' do
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  @menu = Menu.find_by_id(params[:menu_id])
  @items = @menu.items
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
  # else
  #   Menu.create(params[:menu])
  #   redirect '/'
  end
end

post '/item/new' do
  if request.xhr?
    @item = Item.create(params[:item])
    content_type :json
    @item.to_json
  end
end

get '/item/delete/:item_id' do
  Item.destroy(params[:item_id])
end