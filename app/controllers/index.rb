get '/menus' do
	@menus = Menu.all
	erb :index
end

post '/menus' do
	Menu.create! params[:menu] # use bang for testing to catch errors
	redirect '/'
end




### GENERAL REDIRECT -- DON'T PUT ANYTHING BELOW THIS LINE

get '/*' do
	redirect '/menus'
end

