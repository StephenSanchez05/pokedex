require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end
  
  get "/signup" do
    erb :signup
  end
  
  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/error'
    else
      User.create(username: params[:username], password: params[:password])
      redirect '/login'
    end
  end
  
  

end
