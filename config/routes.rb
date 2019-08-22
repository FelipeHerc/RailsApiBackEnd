Rails.application.routes.draw do
  resources :companies
  resources :sectors
  resources :owners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
