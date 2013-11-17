get '/' do
  # Look in app/views/index.erb
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  p @menu = Menu.find_by_id(params[:menu_id])
  redirect '/'
end
  

post '/menu/new' do
  params[:menu]
  Menu.create(params[:menu])
  redirect '/'
end