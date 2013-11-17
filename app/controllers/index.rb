get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/menus/new' do
  erb :new
end

post '/menus/new' do
  @menu = Menu.create!(name: params[:menu_name])
  redirect "/menus/#{@menu.id}"
end

get '/menus/:id' do
  # params[:id]
  erb :menu_id
end

post '/menus/:id' do
  # p params
  # p params[:id]
  # p params["id"]
  p "Inside menus/1 post route."
  erb :menu_id
end

get '/items' do
  erb :items
end