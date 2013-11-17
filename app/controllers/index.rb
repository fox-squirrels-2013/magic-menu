get '/' do
  # Look in app/views/index.erb
  # erb :index
  redirect '/menus/new'
end

get '/menus/new' do 
  @menus = Menu.all
  erb :new 
end

post '/menus/new' do 
  Menu.create(params[:menu])

  redirect '/menus/new'
end

get '/menus/:id' do 
  @menu = Menu.find(params[:id])
  erb :show
end
