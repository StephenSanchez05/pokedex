class TrainerController < ApplicationController
  
  get '/trainers' do
    @trainers = Trainer.all
    erb :'/trainers.index'
  end
  
  get 'trainers/new' do
    @pokemon = Pokemon.all
    erb :'/pokemon/new'
  end
  
  post '/trainers' do
    @trainer = Trainer.create(params[:trainers])
    if !params["pokemon"]["name"].empty?
      @trainer.pokemon << Pokemon.create(name: params["pokemon"]["name"])
    end
  redirect "/owners/#{@trainers.id}"
  end