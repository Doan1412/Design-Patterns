Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'build_gaming_computer', to: 'computers#build_gaming_computer'
  resources :users, only: %i(new create show)
  resources :articles, only: %i(index)
end
