Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'

  resources :flights
  resources :passengers

  post '/passenger/:id/flights', to: 'passenger_flights#create'
end
