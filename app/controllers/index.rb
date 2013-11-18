require 'json'

get '/' do
	redirect '/menus'
end


########show menus####################
get '/menus' do
  @menus = Menu.all
  erb :menus
end

get '/menus/:id' do 
	@menu = Menu.find(params[:id])
	@items = Item.all
	erb :view_menu
end



#########create menu#######################
post '/menus' do
	puts params
	@menu = Menu.create(params[:menu])		#stringify keys error happens when you only pass a value and its expecting a hash
	content_type :json
	{item: @menu.id, name: @menu.name}.to_json

	# p params
	# Menu.create(params[:menu])
	# redirect '/menus'
end

post '/menus/:id' do 
	puts "*"*80
	puts params
	@menu = Menu.find(params[:id])
	@item = Item.find(params[:item_id])
	@menu.items << @item
	content_type :json
	{item: @item.id, name: @item.name, price: @item.price}.to_json
end

########view items#################
get '/items' do
	@items = Item.all 
	erb :items
end


#########create items################
post '/items' do
	p params
	@item = Item.create(params[:item])
	content_type :json
	{item: @item.id, name: @item.name, price: @item.price}.to_json
	# redirect '/items'
end


#########delete menus and items###############
delete '/items' do 
	@item = Item.find(params[:id]).destroy
end

delete '/menus/:id' do 
	puts "*"*80
	p params
	puts "*"*80
	@menu = Menu.find(params[:menu][:id])
	@item = Item.find(params[:item][:id])
	@menu.items.destroy(@item.id)
	content_type :json
	{item: @item.id}.to_json
	#expecting a param [:item_id] to delete
	# @menu.items.where()
	# @item = Item.find(params[:id])
end 






















