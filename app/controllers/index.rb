get '/' do
  # Look in app/views/index.erb
  @menu = Menu.all
  erb :index
end

get '/:id' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  p params
  p Menu.create(params)
  @menu = Menu.all
  erb :index
end

put '/:id' do
end

delete '/:id' do
end

get '/item' do
end

post '/item' do
end

put '/item/:id' do
end

delete '/item/:id' do
end