class PokemonsController < ApplicationController

def new

end

def create
	byebug
	# Receives a json object
	# Convert json object back into an array
	pokemon_array = JSON.parse(params[:jsonData])
	# create new pokemon for user
	pokemon = current_user.pokemons.new(pokemon_array[0])

	if pokemon.save
		redirect_to root_path
		
		# deduct money from user
	else
		redirect_to root_path
		# do not deduct coins from user
	end

end

end
