Rails.application.routes.draw do
  resources :items do
    collection do
      post 'update_order'
    end
  end
  root 'items#index'
end
