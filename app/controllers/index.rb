require 'json' 

get '/' do 
@menu_items = Menu.all 
@item = Item.all
erb :index
end 

post '/menu' do 
  menu = Menu.new 
  menu.description = params[:menu]
  menu.save 
  @menu_items = Menu.all 
  erb :index
end 

get '/menu' do 
  @menu_items = Menu.all
  @item = Item.all
  erb :menu
end 

post '/menus/:id' do 
  @menu = Menu.find(params[:id])
  @item = Item.find(params[:item_id])
  @menu.items << @item
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
