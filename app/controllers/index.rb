get '/' do
  erb :index
end

#### MENUS #########
get '/menus' do
  @menus = Menu.all
  erb :menus
end

post '/menus' do
  Menu.create(params[:menu])
  redirect '/menus'
end

#### EACH MENU ######
get '/menus/:id' do
  @this_menu = Menu.find(params[:id])
  @items = Item.all
  erb :each_menu
end



#### ITEMS #########
get '/items' do
  @items = Item.all
  erb :items
end

post '/items' do
  Item.create(params[:item])
  redirect '/items'
end

                                                           