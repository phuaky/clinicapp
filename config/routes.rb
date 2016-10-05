Rails.application.routes.draw do
  resources :specialties
  resources :doctors
  resources :timeslots
  resources :days
  resources :complaints
  resources :patients
  root 'public#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :appointments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
