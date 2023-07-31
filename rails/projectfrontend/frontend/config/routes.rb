Rails.application.routes.draw do
  root 'home#index'

  get '/personal', to: 'home#personal'
  post '/personal', to: 'home#create_personal'
  get '/address', to: 'home#address'
  post '/address', to: 'home#create_address'
  get '/official', to: 'home#official'
  post '/official', to: 'home#create_official'
end
