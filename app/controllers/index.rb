get '/' do
  if current_user?
    erb :index
  else
    redirect '/login'
  end
end

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


get '/menu/new' do
  erb :new_menu
end

post '/menu/new' do
  @menu = Menu.create(params[:menu])
  redirect '/'
end

get '/menu/:id' do
  
  erb :menu
end 