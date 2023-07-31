Rails.application.routes.draw do
  devise_for :users
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'home#index'

  get '/personal', to: 'home#personal'
  post '/personal', to: 'home#create_personal'
  get '/address', to: 'home#address'
  post '/address', to: 'home#create_address'
  get '/official', to: 'home#official'

  post '/official', to: 'home#create_official'
  devise_scope :user do
    get 'users/sign_out', to:'devise/session#destroy'
  end
  get 'home/index', to: 'home#index', as: :products_search

end

