Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :externals
  resources :groups
  # get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
