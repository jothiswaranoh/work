Rails.application.routes.draw do
 root 'main#home'

  get 'main/home', to: 'main#home', as: 'main_home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
