get '/' do
  # Look in app/views/index.erb
  @menus = Menu.all
  erb :index
end

post '/menu/new' do
  p params[:menu]
  p Menu.create(params[:menu])
  redirect '/'
end