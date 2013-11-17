get '/' do
  @menus = Menu.all
  erb :index
end

post '/' do
  @menu = Menu.create(name: params[:name])
  if request.xhr?
    menu_name = {id: @menu.id, name: @menu.name}
    content_type :json
    menu_name.to_json
  else
  redirect '/'
  end
end

get '/menus/update/:id' do 
  @menu = Menu.find(params[:id])
  erb :update_menu
end

post '/menus/update/:id' do 
  @menu = Menu.find(params[:id])
  @item = Item.create(name: params[:name], price: params[:price])
  @join = MenuItems.create(menu: @menu.id, item: @item.id)
  @menu.update_attributes(name: params[:name])
  p params
  redirect '/'
end

delete '/menus/delete/:id' do
  Menu.find(params[:id]).destroy
  redirect '/menus'
end

# ///////////////////////////////////////////
# <input type="hidden" name="_method" value="delete">
# get '/' do
#   # Look in app/views/index.erb
#   @note
#   erb :all
# end

# post '/' do
#   p params
#   # user = User.create(username: params[:username], email: params[:emal])
#   @note = Note.create(notetext: params[:notetext])
#   redirect '/notes'
# end

get '/notes' do
  p Note.all
  @notes = Note.all.sort
  erb :all
end

get '/update/:id' do
  @note = Note.find(params[:id])
  erb :update
end

post '/update/:id' do
  p params
  @note = Note.find(params[:id])
  @note.update_attributes(notetext: params[:notetext])
  redirect '/notes'
end

post '/delete/sure/:id' do
  @note = Note.find(params[:id])
  erb :delete
end

post '/delete/:id' do
  Note.find(params[:id]).destroy
  redirect '/notes'
end