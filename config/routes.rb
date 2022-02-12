Rails.application.routes.draw do
  resources :points
  resources :members
  resources :events
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
