get '/menus' do
	@menus = Menu.all
	erb :index
end

post '/menus' do
	Menu.create! params[:menu] # use bang for testing to catch errors
	redirect '/'
end

get '/menus/:id' do
	@menu = Menu.find(params[:id])
	@items = @menu.items
	@all_items = Item.all
	erb :menus
end

post '/menus/:id/additem/:item_id' do
	menu = Menu.find(params[:id])
	item = Item.find(params[:item_id])
	menu.items << item
	# redirect "/menus/#{params[:id]}"
	[item.name, int_to_dollars(item.price)]
end

delete '/menus/:id/additem/:item_id' do
	@menu = Menu.find(params[:id])
	@menu.items.delete(Item.find(params[:item_id]))
	# redirect "/menus/#{params[:id]}"
end

get '/items' do
	@items = Item.all
	erb :items
end

post '/items' do
	Item.create! name:  params[:item][:name],
				 price: dollars_to_int(params[:item][:price]) # not in standard params format due to conversion
	redirect '/items'
end


### GENERAL REDIRECT -- DON'T PUT ANYTHING BELOW THIS LINE

get '/*' do
	redirect '/menus'
end

