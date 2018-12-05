Rails.application.routes.draw do

  	# OAuth
 	get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  	
	post '/coins' => "users#coin_generator"
	patch '/pokemon/:id' => "users#update"
	resources :users
	resources :pokemons
	root "welcome#index"

	post '/sign_in' => "users#sign_in"
	post '/sign_out' => "users#sign_out"
	post '/pokedex' => "users#pokedex"
	post '/find_pokemon' => "pokemons#find_pokemon"
	get '/pokemon_search_autocomplete' => "pokemons#pokemon_search_autocomplete"
	get '/search_pokemon' => "pokemons#search_pokemon"
 	


end
