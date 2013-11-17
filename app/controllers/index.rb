require 'sinatra'
require 'sinatra/activerecord'
# require 'active_record'
require_relative '../models/menu'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

# get '/menus' do
#   erb :index
# end

# get '/menus/new' do
#   erb :menus_new
# end

# post '/menus' do
#   Menu.create(params)
#   redirect '/menus'
# end
