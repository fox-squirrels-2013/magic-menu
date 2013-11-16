get '/' do
  @menus = Menu.all
  erb :index
end

get '/menus' do 
  redirect '/'
end

get '/menus/new' do
  erb :new_menu
end

post '/menus' do
  @menu = Menu.create(params)
  redirect '/'
end

get '/menus/:id' do
  @menu = Menu.find_by_id(params[:id])
  erb :menu
end
