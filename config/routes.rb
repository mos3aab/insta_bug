Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
  # Defines the root path route ("/")
  root "apps#index"
  resources :apps 
  get '/applications/:application_token/chats', to: 'chats#index'
  post '/application/chat', to: 'chats#create'
  get '/applications/chat/:id', to: 'messages#index'
  post '/application/chat/msg', to: 'messages#create'
  
end
