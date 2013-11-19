def current_user
  @current_user ||= User.find(session[:user_id])
end

def current_user?
  session[:user_id]
end 

def user_menus
  Menu.where(user_id: session[:user_id])
end

def menu_items
  Menuitem.where(menu_id: current_menu.id)
end


def logged_in_display
  erb :_logged_in_display if session[:user_id]
end

def current_menu
  @menu ||= Menu.find(params[:id])
end

def global_items
  @items ||= Item.all
end