Rails.application.routes.draw do
  resources :sells
  get 'terms/terminosycondiciones'
  get 'about/aboutus'
  resources :contacts, only: [:new, :create, :index, :show]
  resources :publications
  resources :products
  resources :clients
  devise_for :users, controllers: {
  sessions: 'users/sessions'
  }

  get "contacts/export_data", to: "contacts#export", as: :export_contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "publications#index"
end
