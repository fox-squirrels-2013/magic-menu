require 'json'

get '/' do
  # Look in app/views/index.erb
  # erb :index
  redirect '/menus'
end


#######################################
# MENUS
#######################################
# decided to change this from the spec
#  because it's a better route
get '/menus' do
	@menus = Menu.all
	erb :show_menus
end

# add a new menu
post '/menus' do
	# expecting params[:menu] as new menu fields
	Menu.create(params[:menu])
	redirect '/menus'
end

# added this route to delete menus
delete '/menus' do
	@menu = Menu.find(params[:id]).delete
	redirect '/menus'
end

#######################################
# ITEMS
#######################################
get '/items' do
	@items = Item.all
	erb :show_items
end

# add a new menu
post '/items' do
	# expecting params[:menu] as new menu fields
	Item.create(params[:item])
	redirect '/items'
end

# added this route to delete items
delete '/items' do
	@item = Item.find(params[:id]).delete
	redirect '/items'
end

#######################################
# MENUS and ITEMS
#######################################
get '/menus/:id' do
	@menu = Menu.find(params[:id])
	@items = Item.all
	erb :show_menu
end

post '/menus/:id' do
	@menu = Menu.find(params[:id])
	@item = Item.find(params[:food_id])
	# We add
	@menu.items << @item
	p @menu.items.length
	content_type :json
	# send back the data we want.  key can be anything we want
	{item_name: @item.name}.to_json

	# @item = Item.create(params[:item])
	# @menu.items.push(params[:food_id]

	# if request.xhr?
	# 	item_info = {id: @item.id, name: @item.name, price: @item.price}
	# 	content_type :json
	# 	item_info.to_json
	# else
	# 	redirect "/menus/#{params[:id]}"
	# end
end

delete '/menus/:id' do
	@menu = Menu.find(params[:id])
	@delete = @menu.items.delete(Item.find(params[:item_id]))
	redirect "/menus/#{params[:id]}"
end
