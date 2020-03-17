class UserController < ApplicationController
  
  get '/users/id' do
    if !logged_in?
      redirect '/trainers'
    end
    @user = User.find(params[:id])
      if !@user.nil? && @user == current_user
      erb :'users/show'
    else
      redirect '/trainers'
    end
  end
  
  get "/signup" do
    erb :signup
  end
  
  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect '/error'
    else
      @user = User.create(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/welcome'
    end
  end
  
  get "/login" do
      erb :login
  end
  
  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/welcome"
    else
      redirect "/error"
    end
  end
  
  get "/welcome" do
  @user = User.find(session[:user_id])
    erb :welcome
  end
  
  get "/show" do
    @user = User.find(session[:user_id])
    erb :'/users/show'
  end
    
  
  get "/logout" do
    if session[:user_id] != nil
      session.destroy
      redirect to "/"
    else
      redirect to "/"
    end
  end
end