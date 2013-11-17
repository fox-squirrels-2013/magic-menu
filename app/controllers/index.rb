require 'json'

get '/' do
  redirect '/menu'
end

get '/menu' do
	erb :index
end

get '/item' do
	erb :item
end

get '/menu/:id' do
	#@items contains all of the item_id's which belong to the selected menu
	@items = []
	@selections = Selection.where(menu_id: params[:id])
	@selections.each do |selection|
		@items << Item.find(selection.item_id)
	end
	erb :assign_item
end

post '/menu/create' do
	content_type :json
	m = Menu.create(params)
	return_obj = {'id' => m.id, 'name' => params['name']}
	return_obj.to_json
end

post '/item/create' do
	Item.create(:name => params["name"], :price => params["price"])
end

post '/menu/item/assign' do
	content_type :json
	Selection.create(:menu_id => params["menu_id"], :item_id => params["item_id"])
	return_obj = {'item' => Item.find(params["item_id"]).name, 'price' => Item.find(params["item_id"]).price}
	return_obj.to_json
end

post '/menu/item/delete' do
	Selection.destroy(params['selectionId'])
end


###DB name = maginmenu_development