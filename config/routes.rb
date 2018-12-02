Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users
  root "welcome#index"

  post '/sign_in' => "users#sign_in"
  post '/sign_out' => "users#sign_out"
end
