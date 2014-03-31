Stickmatic::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :packs
  resource :order, only: [:update]
  root 'home#index'
  get '/tos', to: 'home#tos', as: 'tos'
  get '/privacy', to: 'home#privacy', as: 'privacy'
  get '/basket' , to: "orders#index", as: 'basket'
end
