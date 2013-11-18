get '/menu/:id' do
  @menu = Menu.find_by_id(params[:id])
  erb :menu_page
end
