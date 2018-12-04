class PokemonsController < ApplicationController
before_action :find_pokemon, only: [:show,:edit,:update]

	def index
		# Only show current_users pokemon. This is the pokédex
		@pokemon = current_user.pokemons
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

	def edit
	end

	def update
		byebug
		if @pokemon.update(get_params)
			redirect_to pokemon_path(@pokemon)
		else 
			render 'edit'
		end
	end

	def show
		
		@pokemon = Pokemon.find_by(id:params[:id])
	end

private

def find_pokemon
	@pokemon = Pokemon.find_by(id:params[:id])
end

def get_params
	params.require(:pokemon).permit(:name)
end

end
