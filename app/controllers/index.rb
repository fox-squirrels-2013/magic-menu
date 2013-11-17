get '/' do
  if Menu.all
    @menus = Menu.all
  end

  erb :index
end

post '/create/new' do
  @menu = Menu.create name: params[:menu][:name]
  
  redirect '/'
end
