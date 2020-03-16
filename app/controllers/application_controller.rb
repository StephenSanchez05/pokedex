require './config/environment'



class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "password"
  set :views, Proc.new { File.join(root, "../views/") }


  get "/" do
    erb :index
  end
  
  get "/welcome" do
     #@user = User.find(session[:user_id])
    erb :welcome
  end
  
  get "/error" do
    erb :error
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

  

