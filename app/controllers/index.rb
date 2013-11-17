get '/' do
  erb :index
end

get '/menus' do
  @menus = Menu.all
  erb :menus
end

post '/menus' do
  Menu.create(params[:menu])
  redirect '/menus'
end

get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  Item.create(params[:item])
  redirect '/items'
end

                                                           