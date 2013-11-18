get '/' do
  if current_user?
    erb :index
  else
    redirect '/login'
  end
end

#Login/ Logout
get '/login' do
  redirect '/' if session[:user_id]
  erb :login
end

post '/login' do
  @user = User.find_by(name: params[:name])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:password_wrong] = "Oops! Password incorrect!"
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

#User Creation
get '/user/new' do
  erb :signup
end

post '/user/new' do
  @user = User.new(params[:user])
  if @user.valid?
    @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    flash[:user_errors] = @user.errors.messages
    redirect '/user/new'
  end
end

#Menu Routes
get '/menu/new' do
  erb :new_menu
end

post '/menu/new' do
  @menu = Menu.create(params[:menu])
  @menu.user_id = current_user.id
  redirect '/'
end

get '/menu/:id' do
  session[:current_menu] = current_menu.id
  erb :menu
end 


#Item Routes
post '/item/new' do
  @item = Item.create(params[:item])
  erb :_item, :layout => false
end

post '/menuitem/add' do
  @menuitem = Menuitem.create(item_id: params["item_id"], menu_id: session[:current_menu])
  erb :_menuitem, :layout => false
end

delete '/menuitem' do
  Menuitem.destroy(params["id"])
end


















