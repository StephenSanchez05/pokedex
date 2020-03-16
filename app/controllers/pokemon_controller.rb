class PokemonController < ApplicationController
  
  get "/pokemon" do
   redirect_if_not_logged_in
    @pokemon = Pokemon.all
    erb :'pokemon/index'
  end
  
  get "/pokemon/new" do
   redirect_if_not_logged_in
    erb :'pokemon/new'
  end
  
  get "/pokemon/:id/edit" do
    redirect_if_not_logged_in
    @pokemon = Pokemon.find(params[:id])
    erb :'pokemon/edit'
  end
  
  post "/pokemon" do
  redirect_if_not_logged_in
  @pokemon = Pokemon.find_or_create_by(params)
  @pokemon.save
  redirect "/pokemon"
  end 
  
  patch '/pokemon/:id' do 
   redirect_if_not_logged_in
    @pokemon = Pokemon.find_by_id(params[:id])
    @pokemon.name = params[:name]
    @pokemon.element = params[:pokemon]
    @pokemon.save
    if @pokemon.save
    redirect "/pokmeon/#{@pokemon.id}"
    else
    redirect 
      "/error"
    end
  end
end