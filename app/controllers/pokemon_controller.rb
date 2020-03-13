class PokemonController < ApplicationController
  
  get "/pokemon" do
    @pokemon = Pokemon.all
    erb :'pokemon/index'
  end
  
  get "/pokemon/new" do
    erb :'pokemon/new'
  end
  
  get "/pokemon/:id/edit" do
    @pokemon = Pokemon.find(params[:id])
    erb :'pokemon/edit'
  end
end