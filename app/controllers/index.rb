get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/:id' do
  # Look in app/views/index.erb
  erb :index
end

post '/' do
  p params
  p Menu.create(params)
  erb :index
end

update '/:id' do
end

delete '/:id' do
end

get '/item' do
end

post '/item' do
end

update '/item/:id' do
end

delete '/item/:id' do
end