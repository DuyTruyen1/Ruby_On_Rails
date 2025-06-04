Rails.application.routes.draw do
  resources :microposts
  resources :users
  root 'users#index'
  get "up" => "rails/health#show", as: :rails_health_check  
end
