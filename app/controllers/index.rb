require 'json' 

get '/' do 
  @menu_items = Menu.all 
  @item = Item.all
  erb :index
end 


post '/menu' do 
  p params
  menu = Menu.create(:description => params[:menu_description])
  content_type :json 
  {id: menu.id, description: menu.description}.to_json

 # @menu_items = Menu.all 
 #  menu = Menu.new 
 #  menu.description = params[:menu]
 #  menu.save  
 #  content_type :json 
 #  {id: @menu_items.last.id, description: @menu_items.last.description}
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
  content_type :json
  {id: @item.id, name: @item.description, price: @item.price}.to_json
end

delete '/menu/:id' do 
  p params
  # {"item_id"=>"2", "splat"=>[], "captures"=>["6"], "id"=>"6"}

  menu = Menu.find(params[:id])
  Singlemenu.where(:item_id => params[:item_id], :menu_id => params[:id] ).first.destroy
  # Item.find(params[:item_id]).destroy
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
  p params
  puts "hitting this line"
  item = Item.create(:price => params[:price], :description => params[:description])
  content_type :json 
  {id: item.id, price: item.price,  description: item.description}.to_json

  # item = Item.new
  # item.description = params[:description]
  # item.price = params[:price]
  # item.save 
  # @item = Item.all
  # erb :item
end 
