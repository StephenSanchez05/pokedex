class UserController < ApplicationController
  
  get '/users/id' do
    if !logged_in?
      redirect '/trainers'
    end
    
    @user = User.find(params[:id])
      erb :'users/show'
      if !@user.nil? && @user == current_user
    else
      redirect '/trainers'
    end
  end
  
  get "/signup" do
    if !session[:user_id]
    erb :signup
  else
    redirect to '/welcome'
  end
  end
  
  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/error'
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
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
end