Rails.application.routes.draw do
  get 'patients/index'
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'profile/index'
  devise_for :users
 
  resources :patients, only: [:show, :edit, :update] do
    resources :doctors, only: [:index]
    resources :categories, only: [:show]
    resources :appointments, only: [:index, :new, :create]
  end
  resources :doctors, only: [:show, :edit, :update] do
    resources :patients, only: [:index]
    resources :appointments, only: [:index]
  end
  resources :appointments, only: [:new, :create, :show, :edit, :update]
  
  root to: 'profile#index'
end
