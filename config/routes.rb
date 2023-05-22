Rails.application.routes.draw do
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'profile/index'
  devise_for :users
 
  resources :patients, only: [:show, :edit, :update] do
    resources :doctors, only: [:index]
    resources :categories, only: [:show]
    resources :appointments, only: [:index, :new, :create]
  end
  resources :appointments, only: [:new, :create, :show]
  root to: 'profile#index'
end
