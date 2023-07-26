Rails.application.routes.draw do
  # Define a route to show the form to create a new student
  get '/student/test', to: 'students#test'

  # Define a route to create a new student
  post '/students', to: 'students#create'

  # Define a route to show a specific student
  get '/students/:id', to: 'students#show', as: 'student'

  # Other routes...

  # Define a root route, for example, if you want the 'new' action to be the homepage
  root to: 'students#test'
end
