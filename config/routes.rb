Rails.application.routes.draw do
  resources :users, only: %i(new create show)
  resources :articles, only: %i(index)
end
