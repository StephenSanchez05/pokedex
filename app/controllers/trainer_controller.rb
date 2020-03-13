require './config/environment'


class TrainerController < ApplicationController
  
  get '/trainers' do
    #redirect_if_not_logged_in
    @trainers = Trainer.all
    erb :'/trainers/index'
  end
  
  get '/trainers/new' do
    #redirect_if_not_logged_in
    @pokemon = Pokemon.all
    erb :'/trainers/new'
  end
  
  get '/trainers/:id/edit' do
    #redirect_if_not_logged_in
    @trainer = Trainer.find(params[:id])
    @pokemon = Pokemon.all
    erb :'/trainers/edit'
  end
  
  post '/trainers/:id' do
    #redirect_if_not_logged_in
    @trainer = Trainer.create(params[:trainers])
    if !params["pokemon"]["name"].empty?
      @trainer.pokemon << Pokemon.create(name: params["pokemon"]["name"])
    end
  redirect "/trainers/#{@trainer.id}"
  end
  

  get '/trainers/:id' do
    #redirect_if_not_logged_in
    @trainer = Trainer.find(params[:id])
    erb :'/trainers/show'
  end
  
  post "/trainers" do
 unless Trainer.valid_params?(params)
    redirect "/bags/new?error=invalid inputs"
  end
  Trainer.create(params)
  redirect "/trainers"
  end 
  
  patch '/trainers/:id' do 
   # redirect_if_not_logged_in
    if !params[:trainers].keys.include?("pokemon_ids")
      params[:trainers]["pokemon_ids"] = []
    end 
    @trainer = Trainers.find(params[:id])
    @trainer.update(params["trainer"])
    if !params["pokemon"]["name"].empty?
      @trainer.pokemon << Pokemon.create(name: params["pokemon"]["name"])
    end
    redirect "/trainers/#{@trainer.id}"
  end
end
    
    
    
    
    
    
    
    
    