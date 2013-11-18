get '/items' do
  erb :item_page
end

get '/item/:id' do
  @item = Item.find_by_id(params[:id]) 
  @items_menus = Item.where(item_id: params[:id])
  erb :item_page
end

post '/item/new' do
  item = Item.create name: params[:title] unless params[:title].empty?
  unless params[:title].empty? 
          params[:menu].each do |menu_id|
    ItemMenu.create item_id: item.id, menu_id: menu_id.to_i unless params[:menu].empty?
          end
  end          
  return item.name if item
  return 'false'
end        
