class WelcomeController < ApplicationController

	def index
		@user=User.new
		@pokemons = Pokemon.all
	end
end
