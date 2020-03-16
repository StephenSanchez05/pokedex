class UserController < ApplicationController
  
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
  
  get "/login" do
    erb :login
  end
  
  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/welcome"
    else
      redirect "/error"
    end
  end
  
  get "/logout" do
    if session[:user_id] != nil
      session.destroy
      redirect to "/login"
    else
      redirect to "/"
    end
  end