Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "emails#index" 
  post '/emails', to: 'emails#create' 
  resources :emails, only: [:new, :show, :index]
  
end
