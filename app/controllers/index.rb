get '/menus' do
	@menus = Menu.all
	erb :index
end

post '/menus' do
	Menu.create( params[:menu] ).to_json
end

get '/menus/:id' do
	@menu = Menu.find(params[:id])
	@items = @menu.items
	@all_items = Item.all
	erb :menus
end

get '/items' do
	@items = Item.all
	erb :items
end

post '/items' do
	i = Item.new params[:item]
	return i.errors[:price].last.to_json unless i.save
	i.to_json			
end

delete '/items/:id' do
	Item.find(params[:id]).delete.to_json
end

post '/menuitems/:menu_id/:item_id' do
	i = Item.find(params[:item_id])
	Menu.find(params[:menu_id]).items << i
	i.to_json
end

delete '/menuitems/:menu_id/:item_id' do
	m = Menu.find(params[:menu_id])
	m.items.delete( Item.find(params[:item_id]) ).to_json
end
