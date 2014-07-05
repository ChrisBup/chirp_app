require 'bundler'
Bundler.require

require_relative 'models/user'
require_relative 'models/chirp'

require_relative 'config.rb'

get '/' do
  @users = User.all
  erb :index
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  username = params[:username]
  new_user = User.create({username: username})
  redirect "/users/#{ new_user.id }"
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

get '/users/:id/chirps/new' do
  @user = User.find(params[:id])
  erb :'chirps/new'
end

post '/users/:id/chirps' do
  user = User.find(params[:id])
  message = params[:message]
  new_chirp = Chirp.create({message: message})
  user.chirps << new_chirp
  redirect "/users/#{params[:id]}"
end

delete '/users/:user_id/chirps/:chirp_id' do
  chirp_id = params[:chirp_id]
  Chirp.delete(chirp_id)
  redirect "/users/#{params[:user_id]}"
end
