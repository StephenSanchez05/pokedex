require './config/environment'



class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "password"
  set :views, Proc.new { File.join(root, "../views/") }


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
  
  get "/welcome" do
    erb :welcome
  end
  
  get "/error" do
    erb :error
  end 
  
  get "/logout" do
    session.clear
    redirect "/"
  end

  def current_user
    User.find(session[:user_id])
  end
  
  helpers do
    
    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You have to be logged in to do that"
      end
    end
    
    def logged_in?
      !!session[:user_id]
    end 
    

    def current_user
    User.find(session[:user_id])
  end
end

end

  

