get '/' do
  # Look in app/views/index.erb
  # erb :index
  redirect '/menus/new'
end

get '/menus/new' do 
  @menus = Menu.all
  erb :new 
end

post '/menus' do 
  Menu.create(params[:menu])
  redirect '/menus/new'
end

get '/items' do 
  @items = Item.all
  erb :items
end

post '/items' do 
  @item = Item.create(params[:item])
  redirect '/items'
end

get '/menus/:id' do 
  @menu = Menu.find(params[:id])
  @items = Item.all
  erb :show
end

post "/menu/:menu_id/item" do 
  @menu = Menu.find(params[:menu_id])
  @item = Item.find(params[:item_id])

  @menu.items << @item
  content_type :json
  {name: @item.name}.to_json
  # @item.to_json
end

post "/menu/:menu_id/item/:item_id/delete" do 

end








# alternative way
# post "/menu/:id/item" do 
#   @items_parameters.each do |item|
#   @menu.items.create(params[:item])
#   end
# end
