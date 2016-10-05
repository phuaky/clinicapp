Rails.application.routes.draw do
  root 'public#index'

  resources :users
  resources :appointments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
