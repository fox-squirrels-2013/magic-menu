require_relative '../helpers/helpers.rb'

enable :sessions

get '/' do
  erb :index
end

post '/menus/create' do
  @menu = Menu.new name: params[:menu_name]
  create_errors(@menu)
  p params[:dataType]
  # if the new menu is valid
  if @menu.valid?
    # save the menu
    @menu.save!
    # if the browser is asking for json
    if params[:dataType] == 'json'
      content_type :json
      @menu.to_json
    # else just redirect
    else
      redirect '/'
    end
  else
    # if the menu is invalid
    if params[:dataType] == 'json'
      # render errors partial if ajax is being used.
      erb :_errors, :layout => false
    else
      redirect '/'
    end
  end
end

get '/clear' do
  session.clear
end

get '/menus/new' do
  erb :index
end

get '/menus/:menu_id' do
  erb :menu
end

get '/items' do
  erb :item
end

delete '/menus/items/delete' do
  ItemMenu.where(menu_id: params[:menu_id], item_id: params[:item_id]).first.destroy
end

post '/items/create' do
  @item = Item.new name: params[:item_name], price: params[:item_price]
  create_errors(@item)
  p params[:dataType]
  if @item.valid?
    @item.save!
    if params[:dataType] == 'json'
      content_type :json
      @item.to_json
    else
      redirect '/items'
    end
  else
    if params[:dataType] == 'json'
      erb :_errors, :layout => false
    else
      redirect '/items'
    end
  end
end

post '/menus/items/create' do
  @item_menu = ItemMenu.new menu_id: params[:menu_id], item_id: params[:item_id]
  menuid = @item_menu.menu_id
  itemid = @item_menu.item_id
  itemname = Item.find(itemid).name
  itemprice = Item.find(itemid).price
  if @item_menu.valid?
    @item_menu.save
    content_type :json
    {:item_id => itemid, :menu_id => menuid, :name => itemname, :price => itemprice}.to_json
  end
end
