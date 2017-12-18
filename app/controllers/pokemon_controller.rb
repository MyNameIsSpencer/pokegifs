require 'json'

class PokemonController < ApplicationController


  def show
    @pokemon = params[:id]
    puts @pokemon
    pokemon_resp = HTTParty.get("http://pokeapi.co/api/v2/pokemon/" + @pokemon)
    # body = JSON.parse(res.body)
    if pokemon_resp.code == 200
      @pokedata = JSON.parse(pokemon_resp.body)
      @pokename = @pokedata['name']
      @pokeid = @pokedata['id']
      @poketype = @pokedata['types'][0]['type']['name']
# binding.pry
    end
    pokemon_resp_giphy = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q="+@pokename+"&rating=g")
    @body = JSON.parse(pokemon_resp_giphy.body)
    @gif = @body["data"][0]["url"]
    @giffer =  "https://giphy.com/gifs/pokemon-"+ @pokename +"-SHyuhBtRr8Zeo"
    @gif_url =  @body['data'][0]['images']['preview_gif']['url']

  end
end

# HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")

# KT9F2SDB03Zrhp0Jvi94L10iwvbp4IJw
