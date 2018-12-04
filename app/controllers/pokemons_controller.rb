class PokemonsController < ApplicationController
before_action :find_pokemon, only: [:show,:edit,:update,:destroy]

	def index
		# Only show current_users pokemon. This is the pokédex
		@pokemon = current_user.pokemons
	end

	def create
		# Receives a json object
		# Convert json object back into an array
		pokemon_array = JSON.parse(params[:jsonData])
		# create new pokemon for user
		pokemon = current_user.pokemons.new(pokemon_array[0])

		if pokemon.save
			redirect_to pokemon_path(pokemon)
			current_user.coins = current_user.coins - 15
			current_user.save
		else
			redirect_to root_path
			flash[:info] = "Generator Failed. Please try again"
			# do not deduct coins from user
		end
	end

	def edit
	end

	def update
		if @pokemon.update(get_params)
			redirect_to pokemon_path(@pokemon)
		else 
			render 'edit'
		end
	end

	def show
	end

	def destroy
		if @pokemon.destroy
			redirect_to pokemons_path
			flash[:success] = @pokemon.name.capitalize + " successfully deleted from your Pokédex!"
		else
			redirect_to pokemon_path(@pokemon)
			flash[:info] = "Failed to destroy pokemon. Please try again"
		end

	end



private

def find_pokemon
	@pokemon = Pokemon.find_by(id:params[:id])
end

def get_params
	params.require(:pokemon).permit(:name)
end

end
