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
	begin
		@menu = Menu.create!(params[:menu])
	rescue ActiveRecord::RecordInvalid => e
		session[:flash] = "menu name has already been taken."
		p session[:flash]
	end
	redirect '/menus'
end

# added this route to delete menus
delete '/menus' do
	@menu = Menu.find(params[:menu_id]).delete
	@menu.to_json
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
	new_item = Item.create(convert_price_to_cents(params[:item]))
	unless new_item.valid?
		session[:flash] = new_item.errors.messages
	end
	redirect '/items'
end

# added this route to delete items
delete '/items' do
	@item = Menu.find(params[:menu_id])
							.items.delete(Item.find(params[:item_id]))
	@item.first.to_json
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
	@item = Item.find(params[:item_id])
	begin
		@menu.items << @item
	rescue ActiveRecord::RecordInvalid => e
		session[:flash] = "this menu already has #{@item.name}"
		return 500
	end
	@item.to_json
end

delete '/menus/:id' do
	@menu = Menu.find(params[:id])
	@menu.items.delete(Item.find(params[:item_id]))
	redirect "/menus/#{params[:id]}"
end
