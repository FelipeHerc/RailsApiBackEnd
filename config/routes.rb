Rails.application.routes.draw do
  resources :possesions
  resources :equips
  resources :cels
  resources :chips
  resources :notebooks
  resources :stats
  resources :companies
  resources :sectors
  resources :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
