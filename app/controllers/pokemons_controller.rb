class PokemonsController < ApplicationController

	def new

	end

	def create

		# Receives a json object
		# Convert json object back into an array
		pokemon_array = JSON.parse(params[:jsonData])
		# create new pokemon for user
		byebug
		pokemon = current_user.pokemons.new(pokemon_array[0])

		if pokemon.save
			redirect_to pokemon_path(pokemon)
			# deduct money from user
		else
			redirect_to root_path
			flash[:info] = "Generator Failed. Please try again"
			# do not deduct coins from user
		end

	end

	def show
		byebug
		@pokemon = Pokemon.find_by(id:params[:id])
	end

end
