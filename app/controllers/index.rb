require 'json' 

get '/' do 
@menu_items = Menu.all 
@item = Item.all
erb :index
end 

post '/menu' do 
  @menu_items = Menu.all 
  menu = Menu.new 
  menu.description = params[:menu]
  menu.save 
  erb :index
end 

get '/menu' do 
  @menu_items = Menu.all
  @item = Item.all
  erb :menu
end 

post '/menu/:id' do 
  @menu = Menu.find_by_id(params[:id])
  @item = Item.find_by_id(params[:item_id])
  @menu.items << @item
  p "test for menu.items" 
  p @menu.items
  p "test for item"
  p @item

  content_type :json
  {item: @item.id, name: @item.description, price: @item.price}.to_json
end

get '/menu/:id' do 
  @menu = Menu.find_by_id(params[:id])
  @items = @menu.items 
  @every_item = Item.all 
  erb :show
end 

get '/item' do 
  @item = Item.all 
  erb :item

end 


post '/item' do 
  item = Item.new
  item.description = params[:description]
  item.price = params[:price]
  item.save 
  @item = Item.all
  erb :item
end 
