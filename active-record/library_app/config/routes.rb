Rails.application.routes.draw do
  get 'main/dashboard', to: 'main#dashboard', as: 'main_dashboard'

  resources :authors do
    resources :books
  end

  resources :suppliers
  resources :accounts
  resources :account_histories
  resources :physicians do
    resources :appointments
  end

  resources :assemblies do
    resources :parts
  end


  resources :employees do
    resources :pictures
  end

  resources :products do
    resources :pictures
  end

  resources :patients
  resources :physicians

  root 'main#dashboard'

end
