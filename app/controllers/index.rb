get '/menus' do
	@menus = Menu.all
	erb :index
end

post '/menus' do
	p params[:menu]
	m = Menu.create params[:menu]
	m.to_json
end

get '/menus/:id' do
	@menu = Menu.find(params[:id])
	@items = @menu.items
	@all_items = Item.all
	erb :menus
end

post '/menuitems/:menu_id/:item_id' do
	m = Menu.find(params[:menu_id])
	i = Item.find(params[:item_id])
	m.items << i
	i.to_json
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
	p i.errors[:price].last unless i.save
	i.to_json			
end

delete '/items/:id' do
	Item.find(params[:id]).delete
	redirect '/items'
end


### GENERAL REDIRECT -- DON'T PUT ANYTHING BELOW THIS LINE

get '/*' do
	redirect '/menus'
end

