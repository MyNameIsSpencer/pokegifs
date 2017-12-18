require 'json'

class PokemonController < ApplicationController


  def show
    @pokemon = params[:id]
    puts @pokemon
    pokemon_resp = HTTParty.get("http://pokeapi.co/api/v2/pokemon/" + @pokemon)
    if pokemon_resp.code == 200
      @pokedata = JSON.parse(pokemon_resp.body)
      @pokename = @pokedata['name']
      @pokeid = @pokedata['id']
      @poketype = @pokedata['types'][0]['type']['name']
    end
  end
end
