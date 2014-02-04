get '/' do
  if Menu.all
    @menus = Menu.all
  end

  erb :index
end

post '/menu/create/new' do
  @menu = Menu.create name: params[:menu][:name]
  
  redirect '/'
end

get '/menu/:id' do
  @id = params[:id]

  @menu = Menu.find(@id)

  @items = Item.where(menu_id: @id)

  erb :menu
end

post '/item/create/new' do
  @item = Item.create(name: params[:item][:name], price: params[:item][:price], menu_id: params[:item][:menu_id])
  redirect 'menu/' + params[:item][:menu_id]
end
