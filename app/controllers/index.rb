get '/' do
  # Look in app/views/index.erb
  erb :index
end

### menu

get '/menus/new' do
  # Look in app/views/index.
  
  @menus = Menu.all 
  @all_ids = @menus.map do |item| item[:id] end



  erb :"menus/new"
end

post '/menus/new' do
  
  @menu = Menu.create(params[:menu])
  
  @menu.to_json
end

get '/menus/:id' do
  @menu = Menu.find(params[:id])
  erb :"menus/show"
end  

delete '/menu' do
  # params ={'id'=>6}
    @menu = Menu.find(params[:id])

    if @menu.delete
      @message = "We deleted #{@menu.name}"
    else
      @message = 'something went wrong'
    end
end 



### items

get '/items/new' do
  # Look in app/views/index.
  
  @items = Item.all 
  @all_ids = @items.map do |item| item[:id] end



  erb :"items/new"
end

post '/items/new' do
  
  @menu = Menu.create(params[:menu])
  
  @menu.to_json
end

get '/items/:id' do
  @menu = Menu.find(params[:id])
  erb :"items/show"
end  

delete '/menu' do
  # params ={'id'=>6}
    @menu = Menu.find(params[:id])

    if @menu.delete
      @message = "We deleted #{@menu.name}"
    else
      @message = 'something went wrong'
    end
end 