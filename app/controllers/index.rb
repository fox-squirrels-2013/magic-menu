get '/menus' do
	@menus = Menu.all
	erb :index
end

post '/menus' do
	Menu.create! params[:menu] # use bang for testing to catch errors
	redirect '/'
end

get '/items' do
	@items = Item.all
	erb :items
end

post '/items' do
	Item.create! params[:item] # use bang for testing to catch errors
	redirect '/items'
end


### GENERAL REDIRECT -- DON'T PUT ANYTHING BELOW THIS LINE

get '/*' do
	redirect '/menus'
end

