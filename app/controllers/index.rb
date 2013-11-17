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

post '/menuitems/:menu_id/:item_id' do
	menu = Menu.find(params[:menu_id])
	menu.items << Item.find(params[:item_id])
	redirect "/menus/#{params[:menu_id]}"
end

delete '/menuitems/:menu_id/:item_id' do
	@menu = Menu.find(params[:menu_id])
	@menu.items.delete(Item.find(params[:item_id]))
	redirect "/menus/#{params[:menu_id]}"
end

get '/items' do
	@items = Item.all
	erb :items
end

post '/items' do
	i = Item.new name:  params[:item][:name],
				 price: dollars_to_int(params[:item][:price]) # not in standard params format due to conversion
	if i.save
		puts 'easy save, bro'
	else
	  p '*' * 50
	  p i
	  p i[:messages]
	end				
	redirect '/items'
end

delete '/items/:id' do
	Item.find(params[:id]).delete
	redirect '/items'
end


### GENERAL REDIRECT -- DON'T PUT ANYTHING BELOW THIS LINE

get '/*' do
	redirect '/menus'
end

