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
	p params
	Menu.create(params[:menu])
	redirect '/menus'
end

post '/menus/:id' do 
	@menu = Menu.find(params[:id])
	@item = Item.create(params[:id])
	@menu.items.add(@items)
	redirect '/menus/#{params[:id]}'

end

########view items#################
get '/items' do
	@items = Item.all 
	erb :items
end


#########create items################
post '/items' do
	p params
	# <input type="text" name="item[name]" value="">
	# <input type="text" name="item[price]" value="">
	Item.create(params[:item])
	redirect '/items'
end


#########delete menus and items###############
delete '/items' do 
	@item = Item.find(params[:id]).delete
end

delete 'menus/:id' do 
	@menu = Menu.find(params[:id])
	dinner.items.delete(Item.find('#{params[:id]}'))
	#expecting a param [:item_id] to delete
	# @menu.items.where()
	# @item = Item.find(params[:id])
end 






















