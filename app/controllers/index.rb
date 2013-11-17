get '/' do
  # Look in app/views/index.erb
  @menus = Menu.all
  erb :index
end

get '/menu/:menu_id' do
  p params
  redirect '/'
end
  

post '/menu/new' do
  p params[:menu]
  p Menu.create(params[:menu])
  redirect '/'
end