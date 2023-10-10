Rails.application.routes.draw do
  resources :contacts
  resources :publications
  resources :products
  resources :clients
  devise_for :users, controllers: {
  sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "publications#index"
end
