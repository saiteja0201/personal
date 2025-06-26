Rails.application.routes.draw do
  

  post '/users',      to: 'users#create'
   get '/users/listing' , to: 'users#listing'
  get '/users/:id' ,  to: 'users#show'
  put '/users/:id' , to: 'users#update'
  delete '/users/:id', to: 'users#distroy'
  patch '/password_update', to: 'users#password'
  post '/login',to: 'authentication#login'

end
