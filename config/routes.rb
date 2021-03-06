# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user
  resources :costcenters
  resources :accesses
  resources :possesions
  resources :equips
  resources :cels
  resources :chips
  resources :notebooks
  resources :stats
  resources :companies
  resources :sectors
  resources :owners
  resources :sessions
  resources :cities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
