Rails.application.routes.draw do
  root 'main#home'
  get '/feed', to: 'main#feed'
  get '/message',  to: 'main#message'
  get '/video',  to: 'main#video'
  get '/games', to: 'main#games'
  get '/excel', to: 'main#roo'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
