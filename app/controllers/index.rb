get '/' do
  erb :index
end

#### MENUS #########
get '/menus' do
  @menus = Menu.all
  erb :menus
end

post '/menus' do
  Menu.create(params[:menu])
  redirect '/menus'
end

#### EACH MENU ######
get '/menus/:id' do
  @this_menu = Menu.find(params[:id])
  @items = Item.all
  erb :each_menu
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

                                                           