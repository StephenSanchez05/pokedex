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
    @trainer = Trainer.find_by_id(params[:id])
    @pokemon = Pokemon.all
    erb :'/trainers/edit'
  end
  
  post '/trainers/:id' do
    #redirect_if_not_logged_in
    @trainer = Trainer.find_by(params[:trainers])
  redirect "/trainers/#{@trainer.id}"
  end
  

  get '/trainers/:id' do
    #redirect_if_not_logged_in
    @trainer = Trainer.find_by_id(params[:id])
    erb :'/trainers/show'
  end
  
  post "/trainers" do
  @trainer = Trainer.create(params)
  @trainer.save
  redirect "/trainers"
  end 
  
  get "/trainers/show" do
    @trainer = Trainer.all
    erb :'/trainers/show'
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
    
    
    
    
    
    
    
    
    