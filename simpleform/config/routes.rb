# config/routes.rb
Rails.application.routes.draw do
  # get '/students/test', to: 'students#test', as: 'test_student'
  resources :students
  # Other routes for your application, if any...
end
